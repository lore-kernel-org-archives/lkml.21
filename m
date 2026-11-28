Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853071;
	b=T5EF0PUTAF1g4OcL3NohacbmVXXzlxeM0K1eujYH0tvRb4RWKRDM3fAlac9uhTubKLbt
	 B1Hhje+lFeNH3VhpPj1Ivq9TQy/+VhJPrzmqYlb9yUjPD3s8dn1fq+ntTVPvy/Oq/pHv1
	 PQFHUyuzf12Cde8pxaOlnlMKR13uJ+3BTjU4IZArdXkznsy8kCRArON9laK8mFhvn2vZw
	 A9puvuuFe6wng2JPKKQIeudZF8HUe9KsaM966LZ2RsdSF+B7LejomBoNez1SBuY46+DGM
	 Fkq2yKYpgnTsUPkslXIirSvCFMZJGcuLmGdOj9satHBEeD9fDp5vfteoPd9riY7+9Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853071;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DnrlLC9aNv4HbXarfIyeAFHiBqO8dNsrY9V/ApXCObA=;
	b=LVeyu5KGSBly0sAdEjvt8mvGHidErIlAo/VwdVWqIZIRkOdIy6Ai2L0hlS6WUJxD+YMy
	 Dbfm45yDMfLRSjrLtildeNYle8txG8jxgANhuWam1nmiHMu2twSo2chiwnvbk7JMI0UKS
	 pyrSWq1J3deqfXu/RP+GTFaP0LhVHEc5D4wIq7dECM40dSjvCAvIa5L4y2nWrdIWCUKVY
	 91ml/aq/uW7dFyaPsqMoZ+RnwXm5G4tN96010vN6JsfqvMeX4Mqc/hsQdqFYu+/J4T4wC
	 v12/OGHXoTYClUUhdrxNs9w+TRS0jZXpidb8gXLfZjv8FdqOrF6Z99M4xA0Rzn+SSvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVuZNIG2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPzu8YFq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C76606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66C76606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EVuZNIG2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YPzu8YFq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AS4BMxN3730826
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DnrlLC9aNv4HbXarfIyeAF
	HiBqO8dNsrY9V/ApXCObA=; b=EVuZNIG2Ygq7xyLvC3cHt9vz6vCQV45jIvgndz
	Zl5lL4Ls0m/55Hkyi4vHcl0MPcJ3Zmbl1pBSqL+Irp9yE5SqgE4o7xCxlheaFpxi
	31FcRROkV9NIvfOUhxoMX/OXrJLHEZcU0eTXSzewsVJECD8vnsOLuRCB4UWuE+1I
	yHSodLhimNwOlfOIeP8+9fQLKky4b7HFWCo8DXp1LWFY1sj074LI2sbCh1huKs7Q
	dJXUBkcXhcjpoRg/hV8P7HZ67dbcpZwULbeuY59Tyua+k+8VXVPSuWy+sYOR1VnV
	q35pObEi1rqkMxbIdrJmNsicfzgLiDONlUZex+DAd6mR/g1A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7qb78evj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 08:04:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-375bac6bd21so8465057eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:04:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795853069; x=1796457869; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DnrlLC9aNv4HbXarfIyeAFHiBqO8dNsrY9V/ApXCObA=;
        b=YPzu8YFqk/8YtN8aUfibAf2lCOrJugMFYbUDarHhDlmgmgR0es+L5lspHMzbPlg0XI
         yjX9MDztNBNF6iNawq4aqztheFKKyC9zMi45WL68A2Y+R9RvYLs5H684PvT92vGmhQfR
         dlPe9+koADaeXye/2YhSFXaHcZO3QwwSjI8ErpaxoaUdApaUCKrjKNG+fdjNl+omf+et
         1sNLKcNlSHR7xo2RujJB8ZI51E3vxgZc8Vxyz24ZoEiYbA9NTAZ3cGMuzu1geUbY5xaJ
         2+nuwerBgBq/kWZGjhHRawwVh7xsutPcEphzVFnin41a0IqiFHx/qroILryBlcZLx+Ao
         CdcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795853069; x=1796457869;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DnrlLC9aNv4HbXarfIyeAFHiBqO8dNsrY9V/ApXCObA=;
        b=pfU2BtRslKQo34M9xHt5FRJ5GS2M0xe+7Ui+4ed2aOF5hXNPhqLMtmljcpsh0f4zSc
         hi+YMkUP4qP6u6QRAiyEIskBSxhuWurO76aJJfZddzq+tDXeuDs7qI0TsiVbACD+tveI
         EdmZzNh3JfZAsVXtIZ9ElWpWCvhArFykbAAvFikRPPaF1A4smwZig5yZ0jvCWs/BNqaI
         VhPQnOY7qSsstpPfUej3UhZ0yS+7PHAK0dxVACEGzfJG/aN2bRj/Ij6iszEKBM5Gsm8h
         NfTHMjmUupH2Kzi6eSihM8nFocvIMr9/6zHO0HLAZQ8Rn05eUkPf+t4ckSTxWJkyVDi4
         yZ6A==
X-Forwarded-Encrypted: i=1; AL+hErG3VgQqrCcFf8d1ddGL2sD7yHpaZmWas2+mXuoLqzoc8p8j3uQqWW6y3R0fgfUSiUwloq7cobUO2CqPGT0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/O8wjSMP6cLX4az6xslsV6HyjtHr3SZpJXQbLBq246/Qs89ZFC
	rhTZtQdydldyYlIRdj7eZp3ySFzH5Jk8BRfa5YG/dUX3odgxmDE/nhv/KG2QJEiKBQ6cUAWUPCO
	zl3A75itPFaIrE0vb9Vyzdzbbv4rK2CXx8ntVgN4AOA+tXsaHwQ0eXTTr1PFnfByG1NaT06GDUE
	c=
X-Gm-Gg: AZFdTZcWb0pcHwJklk6QahokMGRTlfW1nHXi48qsY8n+ZxKPlS/o8zY/Tx0OU5SI7S7
	6lU2YDiHcLVQk41DPf43Z2xSGBPQYMx4e06rToxt8HLuUEYOKJivo9XSMW/8RSCe3roxVU5EETC
	ZfMTJA4QqqVTytqNOMzDlsHtPUSZ5nWyPh2XFb/ilYBBpMI/OGc7/AIqe7wuBNCKDSr+Szi0ZCh
	8EPHAgaoIwv7SXccXbNeLBTwxVBqYjpFB4MAAnwZaxqOtlxoeoNESLZwPRy5TaSPhVgl7vCaOue
	+SJrWelXiKI0yuYCDxqYj4BIWUB1kWtHueCTcwg3ge7bik38m/zg0h4v1yCQ1gUHm426kUj0EpC
	/MFUFtBhX5sWkypY9+PfTQzuqaoi1pJvGdEi2dV4Ulhcm7adSEznqmH4fzDBA9tkepq+h7tbEPS
	meLQ==
X-Received: by 2002:a05:7301:6782:b0:385:2ea8:aac7 with SMTP id 5a478bee46e88-3852ea8d7d4mr36874379eec.23.1795853068912;
        Sat, 28 Nov 2026 00:04:28 -0800 (PST)
X-Received: by 2002:a05:7301:6782:b0:385:2ea8:aac7 with SMTP id 5a478bee46e88-3852ea8d7d4mr36874350eec.23.1795853068250;
        Sat, 28 Nov 2026 00:04:28 -0800 (PST)
Received: from hu-gkanala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm89129463eec.21.2026.11.28.00.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 00:04:27 -0800 (PST)
From: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 13:33:37 +0530
Subject: [PATCH] soundwire: bus: detect SDCA cascade on peripherals
 reporting class_id 0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261128-sdw-sdca-cascade-v1-1-a97540779103@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANiKCmsC/yXMuw6DMAyF4VdBnhspyYDSvkrF4DgOuAOtYm4S4
 t0JdDjDN5x/B+UirPBqdii8iMp3rHCPBmjAsWcjqRq89a1zPhhNax2hIVTCxCZQi9Ha8Mw5Qr3
 9CmfZ7uS7+1vn+GGarg4cxwk90yINdAAAAA==
X-Change-ID: 20261128-sdw-sdca-cascade-8c6ab0089ffb
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, ckeepax@opensource.cirrus.com,
        linux-kernel@vger.kernel.org,
        Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: V4VeVuw-ZGOrd2NfoRigIBMJaObF1HFX
X-Proofpoint-GUID: V4VeVuw-ZGOrd2NfoRigIBMJaObF1HFX
X-Authority-Analysis: v=2.4 cv=VaBir1p9 c=1 sm=1 tr=0 ts=6b0a8b0e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=q1UXutW6kLyKz-ceUZQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDAzMSBTYWx0ZWRfX7XUZTUCpURzF
 iqLBiJD4xtIxHQmSYrvB4kgTNLL0jEuuKYnj1/df9bNp/kgY6wXF28BmWiPB9Y9Z/JFkPgGlnc0
 bRXPvhXjjFgC2Ir3ThTa5ut4nsMfFgU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDAzMSBTYWx0ZWRfX/raPJLDd8MzJ
 2GrEkJwnaS1rj6XpzFw4mVP7ADMAMgDbp5PAdpXf94t/9ygvsCnl1fSacllXk3y6LDEQG8aP9CR
 2nJ9YadOJiIs5XTFGhNPgtd6MoNNN0IfF02X29Ik1fLvfznonGp/Q2fASrSjIJE6yU0L5XFwB8F
 qEGyqgUAsYPQeCVoGN27/UEnkJVRp0rdy+l7ENrEJRaymjYVBYOxb3Vp8IEwWVYenR78Staatom
 EANQG1kT6YufyIxkveS8AVRXoO5WyfpHHt3IUoO8A+8EeF5rT6i8ffmEGVcmKlRnw8zrkz8onK2
 sElYGCsjuSyHydJuPfaZcPKfJI7Qg5/KoSxQNu6FTkSB4W9hAJNprRBVa6OPHbWThA7QCrvBL3L
 BBPYJEMGqfsROwRegROZ/b+/gBdmt2N86bta+hL79EMc1eZLEnub1cik9BSW2+QXMtdPX6q7Gox
 6WMwmdu+M8sAMGF/B5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611280031

sdw_handle_slave_alerts() only reads DP0_INT, and so can only ever see
SDCA_CASCADE, when the peripheral enumerates with a non-zero class_id.
That is what the SDCA amendment requires, and it holds for most SDCA
peripherals.

A peripheral that enumerates with DevId_5 == 0 has its SDCA interrupts
left invisible to the bus driver: SDCA_CASCADE is never read, so
slave_notify is never set from it, and if the peripheral also masks
SCP_INT1.IMPL_DEF there is no other path to it either. Neither
handle_nested_irq() nor .interrupt_callback() is ever reached and the
SDCA regmap-irq handlers for its Functions never run, so interrupt
driven features such as jack detection silently do nothing. WCD9378 is
one such peripheral.

Fall back to sdca_data.num_functions when class_id is zero. It is
already maintained for every SDCA peripheral: the ACPI path fills it in
from the DisCo tables, and a peripheral with no DisCo enumeration seeds
it from its own .probe, in both cases long before an SDCA interrupt can
be unmasked. No new property or quirk is needed, and nothing changes
for a peripheral that reports its class_id correctly.

Signed-off-by: Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>
---
A follow-up ASoC series enabling jack detection on the WCD9378 SDCA
codec depends on this at runtime; there is no build dependency and it
will be posted separately once this is applied.
---
 drivers/soundwire/bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
index aeaae5a57c89..4a88b2af7447 100644
--- a/drivers/soundwire/bus.c
+++ b/drivers/soundwire/bus.c
@@ -1693,7 +1693,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 		goto io_err;
 	}
 
-	if (slave->id.class_id) {
+	if (slave->id.class_id || slave->sdca_data.num_functions) {
 		ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 		if (ret < 0) {
 			dev_err(&slave->dev,
@@ -1833,7 +1833,7 @@ static int sdw_handle_slave_alerts(struct sdw_slave *slave)
 			goto io_err;
 		}
 
-		if (slave->id.class_id) {
+		if (slave->id.class_id || slave->sdca_data.num_functions) {
 			ret = sdw_read_no_pm(slave, SDW_DP0_INT);
 			if (ret < 0) {
 				dev_err(&slave->dev,

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20261128-sdw-sdca-cascade-8c6ab0089ffb

Best regards,
--  
Gopi Chandra Sekhar Reddy Kanala <gopi.kanala@oss.qualcomm.com>

