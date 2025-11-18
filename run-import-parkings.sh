#!/usr/bin/env zsh

tables=(
    billingHistoryEntries
    permitDefinitions
    bookings
    lanes
    cameras
    clientBillingInformation
    comments
    concurrentPassages
    users
    creditCards
    DATABASECHANGELOG
    DATABASECHANGELOGLOCK
    facilities
    generatedReceipt
    incrementTable
    kioskPriceOfferForSession
    maintenanceVehicles
    operatorReceiptNumberConfigurations
    ownerLookup
    parkingEvents
    parkingPermitHistory
    snapshots
    stays
    parkings
    passageEvents
    permitAllocations
    permitResolutionHistory
    permits
    permitZonesToProducts
    plateChangeHistory
    plateChangeAffectedSessions
    plates
    problematicPlateHistory
    queuedParkingRelatedEvents
    sales
    sessionAnonymizationTimeframes
    sessionEvents
    sessionInvoicingInformation
    sessions
    sessionsAndSales
    sessionsForRegisteredPayment
    stayEvents
    unitOfWork
    unusedPermits
    zones
    zoneSettings
)

PROJECT="autopay-test-core"
INSTANCE="parkings"
DATABASE="parkings"
                                                                             #instance-database
BASE_URI="gs://autopay-test-core-backup-daily-spanner/backups/2025-11-18/parkings-parkings"

for table in "${tables[@]}"; do
    echo "Processing table: $table"

    ./spanner-migration-tool import \
        -project "$PROJECT" \
        -instance "$INSTANCE" \
        -database "$DATABASE" \
        -source-format="csv" \
        -source-uri="${BASE_URI}-${table}-00000-of-00001.csv" \
        -schema-uri="${BASE_URI}-${table}_SCHEMA.json" \
        -table-name="$table" \
        -log-level DEBUG

    if [ $? -eq 0 ]; then
        echo "Successfully imported $table"
    else
        echo "Failed to import $table"
    fi
    echo "---"
done
