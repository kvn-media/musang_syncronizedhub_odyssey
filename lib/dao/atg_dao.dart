import '../src/generated/prisma_client/client.dart';
import '../src/generated/prisma_client/prisma.dart';
import 'package:orm/orm.dart';

createAtgMultipleRecords(PrismaClient prisma) async {
  final affectedRows = await prisma.atg.createMany(
    data: PrismaUnion.$2([
      ATGCreateManyInput(
        atgTimestamp: DateTime.parse("2024-01-10 10:00:00"),
        levelBarrel: PrismaUnion.$1(1000.0),
        volumeChangeBarrel: PrismaUnion.$1(0.0),
        avgTempCelcius: PrismaUnion.$1(20.0),
        waterLevelMeter: PrismaUnion.$1(0.1),
        productTempCelcius: PrismaUnion.$1(0.0),
        alarm: PrismaUnion.$1("None"),
        siteId: PrismaUnion.$1(BigInt.from(1)),
      ),
      ATGCreateManyInput(
        atgTimestamp: DateTime.parse("2024-01-10 11:00:00"),
        levelBarrel: PrismaUnion.$1(980.0),
        volumeChangeBarrel: PrismaUnion.$1(-20.0),
        avgTempCelcius: PrismaUnion.$1(21.0),
        waterLevelMeter: PrismaUnion.$1(0.1),
        productTempCelcius: PrismaUnion.$1(0.0),
        alarm: PrismaUnion.$1("None"),
        siteId: PrismaUnion.$1(BigInt.from(1)),
      ),
      ATGCreateManyInput(
        atgTimestamp: DateTime.parse("2024-01-10 12:00:00"),
        levelBarrel: PrismaUnion.$1(950.0),
        volumeChangeBarrel: PrismaUnion.$1(-30.0),
        avgTempCelcius: PrismaUnion.$1(22.0),
        waterLevelMeter: PrismaUnion.$1(0.1),
        productTempCelcius: PrismaUnion.$1(30.0),
        alarm: PrismaUnion.$1("High temperature"),
        siteId: PrismaUnion.$1(BigInt.from(1)),
      ),
      ATGCreateManyInput(
        atgTimestamp: DateTime.parse("2024-01-10 13:00:00"),
        levelBarrel: PrismaUnion.$1(950.0),
        volumeChangeBarrel: PrismaUnion.$1(0.0),
        avgTempCelcius: PrismaUnion.$1(22.0),
        waterLevelMeter: PrismaUnion.$1(0.1),
        productTempCelcius: PrismaUnion.$1(30.0),
        alarm: PrismaUnion.$1("High temperature"),
        siteId: PrismaUnion.$1(BigInt.from(1)),
      ),
      ATGCreateManyInput(
        atgTimestamp: DateTime.parse("2024-01-10 14:00:00"),
        levelBarrel: PrismaUnion.$1(930.0),
        volumeChangeBarrel: PrismaUnion.$1(-20.0),
        avgTempCelcius: PrismaUnion.$1(21.0),
        waterLevelMeter: PrismaUnion.$1(0.1),
        productTempCelcius: PrismaUnion.$1(28.0),
        alarm: PrismaUnion.$1("High temperature cleared"),
        siteId: PrismaUnion.$1(BigInt.from(1)),
      ),
      ATGCreateManyInput(
        atgTimestamp: DateTime.parse("2024-01-11 09:00:00"),
        levelBarrel: PrismaUnion.$1(910.0),
        volumeChangeBarrel: PrismaUnion.$1(-20.0),
        avgTempCelcius: PrismaUnion.$1(21.0),
        waterLevelMeter: PrismaUnion.$1(0.1),
        productTempCelcius: PrismaUnion.$1(0.0),
        alarm: PrismaUnion.$1("None"),
        siteId: PrismaUnion.$1(BigInt.from(1)),
      ),
      ATGCreateManyInput(
        atgTimestamp: DateTime.parse("2024-01-11 12:00:00"),
        levelBarrel: PrismaUnion.$1(900.0),
        volumeChangeBarrel: PrismaUnion.$1(-10.0),
        avgTempCelcius: PrismaUnion.$1(20.0),
        waterLevelMeter: PrismaUnion.$1(0.1),
        productTempCelcius: PrismaUnion.$1(0.0),
        alarm: PrismaUnion.$1("None"),
        siteId: PrismaUnion.$1(BigInt.from(1)),
      ),
      ATGCreateManyInput(
        atgTimestamp: DateTime.parse("2024-01-11 13:00:00"),
        levelBarrel: PrismaUnion.$1(870.0),
        volumeChangeBarrel: PrismaUnion.$1(-30.0),
        avgTempCelcius: PrismaUnion.$1(21.0),
        waterLevelMeter: PrismaUnion.$1(0.1),
        productTempCelcius: PrismaUnion.$1(0.0),
        alarm: PrismaUnion.$1("None"),
        siteId: PrismaUnion.$1(BigInt.from(1)),
      ),
      ATGCreateManyInput(
        atgTimestamp: DateTime.parse("2024-01-11 14:00:00"),
        levelBarrel: PrismaUnion.$1(850.0),
        volumeChangeBarrel: PrismaUnion.$1(-20.0),
        avgTempCelcius: PrismaUnion.$1(20.0),
        waterLevelMeter: PrismaUnion.$1(0.1),
        productTempCelcius: PrismaUnion.$1(0.0),
        alarm: PrismaUnion.$1("None"),
        siteId: PrismaUnion.$1(BigInt.from(1)),
      ),
      ATGCreateManyInput(
        atgTimestamp: DateTime.parse("2024-01-11 15:00:00"),
        levelBarrel: PrismaUnion.$1(850.0),
        volumeChangeBarrel: PrismaUnion.$1(0.0),
        avgTempCelcius: PrismaUnion.$1(21.0),
        waterLevelMeter: PrismaUnion.$1(0.1),
        productTempCelcius: PrismaUnion.$1(30.0),
        alarm: PrismaUnion.$1("High temperature"),
        siteId: PrismaUnion.$1(BigInt.from(1)),
      ),
      ATGCreateManyInput(
        atgTimestamp: DateTime.parse("2024-01-12 08:00:00"),
        levelBarrel: PrismaUnion.$1(950.0),
        volumeChangeBarrel: PrismaUnion.$1(100.0),
        avgTempCelcius: PrismaUnion.$1(20.0),
        waterLevelMeter: PrismaUnion.$1(0.1),
        productTempCelcius: PrismaUnion.$1(0.0),
        alarm: PrismaUnion.$1("None"),
        siteId: PrismaUnion.$1(BigInt.from(1)),
      ),
    ]),
  );

  print({
    "count": affectedRows.count,
  });

  final atgs = await prisma.atg.findMany();
}
