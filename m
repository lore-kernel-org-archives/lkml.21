Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.2.20
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795123928;
	b=ENOyBJZIeESU1e/yU+i/5+sU6ou8kNQpFH1wK24RM144YcEH7Qu5d9LPD2HVjtsUktZH
	 fJNFNhkyqPFHz1q453tXOxnabdch/awNgd4Hdg/6HPPOyfl2eUY86Sy3slMp151cnBcSw
	 koZ5AvVDDDyl4XZO/F5pSmN4ujLplVDS2FXmpP+oeb2Pa1wS1OqQIqWdxCOqg4j/f7QPB
	 gzMrigyNEjZt+zAB+0dfjw6mHaoXdIAbDoE34NlrFrwh+2dAlhxza852slgTFVzqGW3wN
	 1JHT1oqc01F+vyF6f+LjU9plV3ZIP9OAUECw87R8FN9k+O5d9DRV7DcHgXl0bpkZe6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123928;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:X-Microsoft-Original-Message-ID:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XDiU012F1uYSBYouMACEzvT12Zxfufn17XbkI1J/usc=;
	b=zX70wCuyK0aRn9q7MLhNaT0gh4L5vlB+K0SF8aEnAoauokx8+sU8TQmdOIyZ5aozv6cq
	 8jm07uj6YC/pM3yormXg+4/HWzmUUnoOXa2X0VGezYhjGavgoZI8gDmw8a4cO2ruth347
	 k5Aiyu2R3qstmn5MH3ZqpZL0F7z/MT9v8zl6pn7JKEpWp6stBm5Kw+Ur55uHuyF4nFxMY
	 BM/h/PcPuo1hd4XwQHTyI4qbyHG8/UPpiMmqDawCLgloWWQvLXS91eJoR43w0x8NQBUwr
	 OpUhzn5WcacWuMdCnSDUk0LBM10gCIhEImk7spN3PQUYkVca4n7hgr0ZkndNW7IWrKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=outlook.com;
	spf=pass smtp.mailfrom=outlook.com;
	dkim=pass header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=rMTbdgnv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.103.2.20
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazolkn19010020.outbound.protection.outlook.com [52.103.2.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD268606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD268606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=outlook.com header.i=@outlook.com header.a=rsa-sha256 header.s=selector1 header.b=rMTbdgnv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyvSzAawNuFsslbhsQx1C1IK4sKq5PyxQ8ERqGFi8d2DcnxHhGO2MvqbG/ffoHq8DVBbaohA2n8hPtQbCPSp7cqP6Juh3/1GVfQD/NMJowi4iP7I8p4f3xDD2ggHhgc8zTmQLM4dOX5Hva6AMmOS1c0sTWx/HJ96p/tG/Dql1tWPghOdQ0iq1WkH/3Kkfq3rQPCOtn7Zu04rPCLiQ1OqVvN2sPrirlbebhCvSVj/dOqjkjjpQpaNe57AFYXjBk4aZn4j0qJA8ZMByt2301yMjow2Z5NpyHQzqKph9hbwX9gYHrQhF2kOTPQPFk3ggzUONguj/WZ0aZ9VXDE6jIsv0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XDiU012F1uYSBYouMACEzvT12Zxfufn17XbkI1J/usc=;
 b=ka4Tg22u2O+vHb3nRdidrSRS1oUQ+zvaxPPmQF0RC7FIt/rxes2T/lN/imk/GbkY4g5vkI95CQAvqdq/B3iCJxJ7xXfRBBzx7mUy+qgOm3L/XXAA0yngGfYl2PLMzaKPIr9iVxoAnr1+RE6VGmhDY9A4ZkwSOKqXi0LApYIebkCc1megQYahOqrkS9aNnQC3Y0CiNoFDmvo6mWDCRUj+1usnac2Cjqhu0ddV36QS5FLmiopXImesN7Ks2R6z3XWOhwED4rnVRaDRYxhwFTceYiNzJIwSd9WeDB+At/ae9r7qnovWBSLWPfo3x+HQvYDNvl4egBDuzNWQqTJNnRb/AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XDiU012F1uYSBYouMACEzvT12Zxfufn17XbkI1J/usc=;
 b=rMTbdgnvwOWH8pWCPTX7T87/LqLdQCwuGtMeXpFlxg08haakJOeuZXgNDUgUa5Cdv8lFKRlcuPe03F147iovYcLQ5q1l3dunyaq4+cedbt/VBS4WasN7IS0tJmcFUmgL7sGIP+50cwZp5uy2qg63KaJ7TYayuEan7IkG2F5ETg+pzTSZzdEyQSiE/IIDuzpVqGG0NdoHRmQNElSNDstyc9BdYJmauW579wMBQoI43fCQDipJMblKHZ6rCUc2ad7bDLMg8YGHlRfws71DShwTzC2qhViCLNxfhs3wNuYNSHCWCTIj2eeik5evEMsqVqOdPF097f4pWZlR8JtLkoJDXA==
Received: from PH7PR19MB6658.namprd19.prod.outlook.com (2603:10b6:510:1ac::6)
 by CH5PR19MB997180.namprd19.prod.outlook.com (2603:10b6:610:2f0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 21:32:05 +0000
Received: from PH7PR19MB6658.namprd19.prod.outlook.com
 ([fe80::3d9d:46c2:d611:dc32]) by PH7PR19MB6658.namprd19.prod.outlook.com
 ([fe80::3d9d:46c2:d611:dc32%4]) with mapi id 15.21.0639.011; Thu, 19 Nov 2026
 21:32:05 +0000
From: Ilyas N <desobei@outlook.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Ilyas N <desobei@outlook.com>
Subject: [PATCH v2] comedi: ni_routing: fix SyntaxWarning in convert_csv_to_c.py
Date: Thu, 19 Nov 2026 16:31:15 -0500
Message-ID:
 <PH7PR19MB66586FC98045CEA8D5067BDCAF792@PH7PR19MB6658.namprd19.prod.outlook.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YQZPR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::8) To PH7PR19MB6658.namprd19.prod.outlook.com
 (2603:10b6:510:1ac::6)
X-Microsoft-Original-Message-ID: <20261119213115.497-1-desobei@outlook.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR19MB6658:EE_|CH5PR19MB997180:EE_
X-MS-Office365-Filtering-Correlation-Id: 3faf1355-b752-40fd-a258-08df46848e62
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799012|51005399006|6140399003|5072599009|41001999006|22091999003|24121999003|8060799015|24021099003|15080799012|23021999003|260925184616899003|5062599005|4302099013|440099028|3412199025|3430499035|26121999007|10035399007|40105399003|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dZdhui6YMPMLbvoGHl6Qrtxyr6p0z3I+LFGyc1cTrhKJTerCOHKlUHlHhE5V?=
 =?us-ascii?Q?yjK/jAnbX8sw/BijMfG7i/bKGYTrYzKYTXDQ5Yo+QLl7zAP8v9i2HdL0DH+x?=
 =?us-ascii?Q?h6/TjPtFZ2yg1cyDOQeMm++C0scAcyA2zIK3xMlYeHWq4aztau59HLMoDOSW?=
 =?us-ascii?Q?wLAdzqUjhlmQsxd+7AN/s7J5a6aXcD9eig9yws4zeKYKumQ7BqN29vJDUSgc?=
 =?us-ascii?Q?lY9At86tcaoLkjptHIxuDK7cTN04kvNW0GE60lz38Rg9dhM4sD3Z/QM72oQj?=
 =?us-ascii?Q?OrYlOlYbzuTUvogdWS3IcVSYcZ6rXvisC9zeAUq+A9agvaroYo10XEI1fwSK?=
 =?us-ascii?Q?gDDbbc5S5TOEq6A8EdRASQAEvHPxkwlSBrmsgYdepWH1a2ubpiLSNZx+NB5n?=
 =?us-ascii?Q?tShTnN2oOM8YFaG84wbwQoQ9FgMg3CtEOgzIkReD14FSqS20nngHYomx1arR?=
 =?us-ascii?Q?roNUorf8sf7gUNnIrSkfLMSWH26WSGzVlgTrBhKn1+a62saVNwoj6l3YLr0a?=
 =?us-ascii?Q?Mgj/j/H3tR108p8oeiQXtSe2Ik12rtlg0YxhHEcTom2koNkw2mtf1uS91OsW?=
 =?us-ascii?Q?zGO1dzXiGL/uVmZqV903Ps1w2aa8A9n6d3R8iLmwiy8XubUj1dabqZrXhJRq?=
 =?us-ascii?Q?kw6QWmk9NH3qO2MEn/MIaRgVwBAsmJ5k91k2PxzBfx4fCSz9BcBd3nJ7+Rmo?=
 =?us-ascii?Q?OfQTAz1so2nPfWTJ7IDJ1bwb1PNqMJW9pG0zEnshN25kl/u240eXvRQL8PrM?=
 =?us-ascii?Q?Y5s7Nm3DCH7TwVbqR44zzFWy7HQ19On/TsuQAIH7vDrcxRARNuxWL8yky9fn?=
 =?us-ascii?Q?9mR1p21yv5a6Y4qehIzsTB9jTUqnA6/rG36v2Jtu2C2ePsJlO5ZcKX6+COMB?=
 =?us-ascii?Q?gsxWFtVfkpnpzKc80bn8zvrumjPBFExuZVO3fu+ZE53vV7uroj1MxUgk2dsZ?=
 =?us-ascii?Q?lQ25OSQ7SAw/LyaYCcyIzAdlnztPldGs+2luh5N6h1M8TlhBo0tYbBIh7SnI?=
 =?us-ascii?Q?JUJNxaqlz8/kQGaLsnIUam6F74zGo+MlNFbFFDJ7pD2AGdkUhyJ4ZGuzbvZs?=
 =?us-ascii?Q?Hfv9RlbsCF/a3v5xWMwLkSN1SFrCjW++GIsOIFPhEHI3jh/ZLdKUBJKV7rhk?=
 =?us-ascii?Q?1bayDzj3fUpDKkfax+9f3sySZyAlWzdaVOA9TLEfzZVKkJJ5tXAatw4=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?spP3VsvojJIqb8QB/HgqREKQoTDRdZ2aD2h36FOnGd/6TsbNPc2RgXsP9O8l?=
 =?us-ascii?Q?49tzBPcOegg+VSVWlrUQHisYpuVy/gXnWcpZlxNd0l+5Gi0f5y36cgWgOGcy?=
 =?us-ascii?Q?8ZL5QApyU4k/2cHz0T/dURUKK/n7vkGO/lvd5/ISUGnHmUw3xbaFogKRIgC0?=
 =?us-ascii?Q?XeRSGOl6I2jiL/EaUk37GsmDClFVe+IL11s0RA6ZSHDNx397R3EmFZKTIR3j?=
 =?us-ascii?Q?O88Is9RIcki69d0pXSClHOOcuzhTE2sLFdgwVNOyEzRqG6GGmUbp5EhzDy+H?=
 =?us-ascii?Q?Hgb9z/RL+kzyCGmjo2Mbw+opbY7fmqI54FjoZuH05xCI5RQceFdvgw5/zwpT?=
 =?us-ascii?Q?MtOYFfdnZh1hoX+sn1rqvqsLlCp91hzHzi2P2asKqfbMRz7lsff5ycsiqj2m?=
 =?us-ascii?Q?glVS7a8K47SvSQpZ2uysZsQ4VFiBSFbokcDgvKSr4UeRdK2CMURp03OHQXS1?=
 =?us-ascii?Q?V4F+RurCBL0ZHvKrkt2UNGw1+WAJb/RqEvU+RTyh1erdEiv6B13dRa6q7vJs?=
 =?us-ascii?Q?sMoDWcCgasnxpoX1Cdzp/f0IDlQVPlqSd2BD+IlAdsLh8UHTv2sXxSPGzQ0e?=
 =?us-ascii?Q?YiY/zX0sycA4DOKvg9xhTqJtoHBqsthuXaGcL7Gw6k4lpdC+AWJJpbfTI0UG?=
 =?us-ascii?Q?CLgm/wJPsrhaTK410+qmCi04XbXOfaD8tl4DOasFu7kxbwxCiv91QP8NeoJx?=
 =?us-ascii?Q?p0YgjsUEEEZ64mKcja1zorGMlxA6F2cpR0VRVyl3zf7hAkPljtAe3LZ0BR80?=
 =?us-ascii?Q?lQnBDDQaIYipxiZFGQCdGEBClCVk+EvjxXaynpHlQMCp2997yYhkryc8q3+b?=
 =?us-ascii?Q?lI9s3OpasQvxMDbXmaICmGvq2M0X7Je/Y3tvC65N2hRLNM5LOZ0dnDmuL+X/?=
 =?us-ascii?Q?IzOFUczcQuMd3BKZUYsPDlWsCbAOcJ/+vtFL6Bw/xw4yq6PV0SAvYHRWnmNZ?=
 =?us-ascii?Q?eOqTGPl9sWabib3lWtFDn8zlwT5SbffwdFIQalGfGnsVGLR3BUYYkjJ2TnJS?=
 =?us-ascii?Q?fGLd6klf/IH60s0O9k1Xn9vnAYgaVSD5uAt4p9nxn76ZbtCuiu8cNcRgEbbJ?=
 =?us-ascii?Q?kFIh+2ssKC0UNjHQm7GoXrOuRm6y9+hqy+gW0f+sLjN7CNOp5mEEwlRO2CZZ?=
 =?us-ascii?Q?m3F9rBrcMhleN0i+0li45hZTVSeb9EJzy1FL8Hn7bS4BG9TalWNdzWf098lZ?=
 =?us-ascii?Q?mwl21Hj6okcpIux+AFPIGYndJr3BDXvIXENPQijCZJO2wQQi2exbXBP1859i?=
 =?us-ascii?Q?pLJOkYq822vv02CU37yAKfyrKD8pCohkqc7ImL/IRR7W5eq3XnQPhFR+0DKp?=
 =?us-ascii?Q?/r2XAeCHqrCoWGFmtMM5RBi3w7sY6PgK1T6v5jlkW+sbMo/3p1WRCGEPnRjO?=
 =?us-ascii?Q?oDJTNbxPX8JPHVNvtyGub0wd5gkc?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3faf1355-b752-40fd-a258-08df46848e62
X-MS-Exchange-CrossTenant-AuthSource: PH7PR19MB6658.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 21:32:05.2177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH5PR19MB997180

convert_csv_to_c.py validates register values against the regex
'[VIU]\([^)]*\)', written as a plain string literal. "\(" and "\)" are
not valid Python escape sequences, so with Python 3.12 and later every
run of the script (e.g. "make c-files") prints:

  convert_csv_to_c.py:47: SyntaxWarning: "\(" is an invalid escape sequence. Such sequences will not work in the future. Did you mean "\\("? A raw string is also an option.

Python currently keeps unrecognized escapes verbatim, so the regex still
works, but the script will stop compiling once this warning becomes an
error.

Use a raw string. The resulting string is identical, so there is no
functional change.

The problem was found by compiling all in-tree Python files with Python
3.14 and SyntaxWarning promoted to an error. The search and this patch
were done with the help of an AI coding assistant (Claude Opus 5.5).
Tested by checking that the script now compiles cleanly with warnings
as errors, that its compiled bytecode, constants and names are
unchanged, and that the regex still accepts all 95 register values used
in the ni_route_values tables.

Signed-off-by: Ilyas N <desobei@outlook.com>
---
v2: Use my real name in From: and Signed-off-by:, as Greg's patch bot
    asked. No code changes.

v1: https://lore.kernel.org/all/PH7PR19MB66587C2BE5E8E94F693B4F14AF7A2@PH7PR19MB6658.namprd19.prod.outlook.com/

 drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py b/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
index 90378fb50580..d19101fc2a94 100755
--- a/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
+++ b/drivers/comedi/drivers/ni_routing/tools/convert_csv_to_c.py
@@ -44,7 +44,7 @@ def routedict_to_structinit_single(name, D, return_name=False):
 
     lines.append('\t\t[B({})] = {{'.format(D0_sig))
     for D1_sig, value in D1:
-      if not re.match('[VIU]\([^)]*\)', value):
+      if not re.match(r'[VIU]\([^)]*\)', value):
         sys.stderr.write('Invalid register format: {}\n'.format(repr(value)))
         sys.stderr.write(
           'Register values should be formatted with V(),I(),or U()\n')
-- 
2.53.0

