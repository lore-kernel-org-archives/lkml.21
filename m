Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526160;
	b=mz+cUc219ZcXGGIF4fczKnNtF9552Rs/Gc9Cai0vvuwKgC0qnQmvgntY6mZYFjo2SAfV
	 RvsIwahOLNstfdP8r/44I1TF3DO5gKLMARBk15TVLOAJ1k+Pastn5rpT0OzmR/n2TX5Av
	 yv9ik+XBMC2Rhk4IfFqqF8gAYALKFY/IqTPx7Q+s9//YPTULI3/TrdcwOowfi5HDq39C3
	 uoXPQZWoXcjsAHTYhRgu5Oy6Amr8sFpgzEKH02FD82Ox5JWTlu4w71mJ9P7Wnf64GbQBE
	 FmG3oKxiJlJtH7jzMOdZ7eijjreZyfNlXM0fQFsBMeOBpiNqtzFVT3xkB6qLgBuhdNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526160;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QRiXeo9zMwXnHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=;
	b=Np6pj8q3iOoNxMraR9nq7qQdNHfaVC73vF5Hjwrj6H0GmNJ3BhFM6w5nmzxBz4F7oiKq
	 FBRoT70ITLlCOuBBQQEKs9dMoK6OJd9C/673k6CBiNEZIHzbT40sfz7knc6CMqkBbGES9
	 UX6OGow3UUFK44iSOJqXRZjwCx9Up6tMH2D7jB/4x8AZLZ6yAh3zRXmIWjoHChFgzMBi+
	 CxNlleLNd4V9wnwosTM/714M+Epwi0l6dyW5/GIR4jRKN67mVq5pbjOM50jpyP4w7cR7g
	 0mtlZDt/jo8BR0Oy6ykKumU5JPpw0trdncyEIDDsf+swkYYAppA+C7U2oZbYjKYlJYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RkUfu4I4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aAHDekUb;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9AC606A6B1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9AC606A6B1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RkUfu4I4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aAHDekUb
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAuPAW636796
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QRiXeo9zMwX
	nHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=; b=RkUfu4I42DsQVz0A39abPrm8qSQ
	HvPzDG/XfgFBHW8ORhh22QDohUDYyar/ea7BsedscqAZHUbxNcj+d2hKD0IhXgsV
	t2wfvCrKNPalhhgh8ng4gC596NYnOlglUUmzzJ5i758YcMQh15sjPWOP2DkCXWVa
	EjncaMi2Zznb8N3k3Lui3b5JNESuipbMfSpP+Te3MIiXUHseGS7Pb/BlZG+7s1wO
	6lvo6ZCpg4kAVDkb3Hb0G2GuC7OVTe/TXWoVP7RCVi8er5Lmb3nyhSJFdg+G2UPf
	axLShUD56m6DUK72tVhimSq0zxGlXaaXbH4NM4XDwRkKFgcJIligFfZX8UQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rphv0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:15:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386b8624cf7so4178151eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795526158; x=1796130958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRiXeo9zMwXnHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=;
        b=aAHDekUbFoBTmPmwEWxRALxKLjHMg4WddSknN8v5vV8wEjGgL3rKNigybJ55nTRMqy
         RyCGc+Ln+XZpw8xuv6JPUuk5OuBaweXVZeP9sIst6I2NdXnkM9dbrY/VllQFGuRUo5Wd
         pJ0QJCg2t5LDPcUPjq0gxxUscdGY5lJWpQfwvn66h54CHTyKtxAR6Sb6a1jAgxEzmxkR
         dTWf6cTfBIdGd9/dkHPH6NmsFWET20sD9iQYcHRa5gChB7pcSwA7w3mrsiRudGF14vhj
         t+1c5cqKCxUK+CoZfEG+1STtFeZ4psOy1VhawJMUGfcwZ1CY1VboS3GNDvvrrCJf/VOE
         631A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526158; x=1796130958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QRiXeo9zMwXnHtKKt3Sdkom7IzkBk+J68m3DqMeVlgU=;
        b=0kSkuanriw4lRf8kQ8asVYUJ7FzdWGSKZW3XqdmmpwgLxOppdpTZL9hxVDtCwliTZr
         X3OLoNnp9kajGD6z36jI7LCOZqXNlNtkyZyWpkO1bBaxIKOvHWT2M5dsxJdiYglFBKIX
         1yoOHfPSooL237YIMG+ew5QjibyrmnYQlLvuKMLv8u7yHFVbm1uEU05OUbixaicu27T9
         uTN3XkPUUU3lvmcXkSWCPv2p0AD6XvFt9UI2RAi3ZEBs7E7hAh6JqCU0zuKSdmP/hn8O
         66pl/sFK5bcQgN0s+gn1UJsQC1GgkGbgb5IOeOqqTZAsAULdMX/v3AmFoq3Rni5eKPQy
         v8aA==
X-Forwarded-Encrypted: i=1; AL+hErGW5kYDqK7+UCeBNWfFCCxf7H2YK7mU4f7BoDRKyld/afSnPZ2hkLrCM07dDoPfGpAnWBcRPAVx/AHaIAc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g9HP1s5oeJwWYHQfICiOyz8jEBcRY0d+vzbzXHkiRN2WvoL3C
	ljmoh25g02xOVE9In+a4aDQkgpkISAeYn0oyFnbU4nC7BTbjwZDH8wNwSlpCps/CO4Fui1Tk/pF
	mjnJcYJJK1CeQD25laGIVJr5edOaIRvlRmaHFJFAoB9yt+SfjeUwrCSyb8bO0OMItPBJF233Ali
	c=
X-Gm-Gg: AZFdTZd7Q6uyZ49gWgOKjFEzx+qL4mvEklKgXmlL4PaFjvF6k/RGeLLXM0R8mh3dKes
	lbGK1pOvJt4/hQ/wEQepBYt9vT+wjvBK6paLfXi5fKiwJ2dtbhoWkekO29Z67XdPXQMSgnJyWyw
	A3v8/hEdzIJ6uFwuT0W7MriTl5AAZBZM813dTF0wIIhwP0UZ7iBsbSvBhkQqwxj/MzA4lUIb/xt
	wdy7vwvj9cd1NDkNJDNIFZaKPFGGhmD94FsWh8wIeHoMr2rjMgKEhYKqZ67mZWsuHw6S/2jG82J
	o1ycpMSaII6FBzhyL53zMl32/Q1hGOwB/MLgD/IJYVhcB9mQ7NlJxIWSX+IFv/w2KerIJiFa0jS
	PmNRZtx4YtK+6npWDFmJy745YqNLUC+4XS6Im1N+93uMmJfQCHohIJo74NxzXKfYkmd0tQixxqz
	l+cdXruYzQ0c5cKdZT/rzq79Jkux8qjJMR+T9gWWtUojEaz1ojuVRVvy/UBUgkyQ==
X-Received: by 2002:a05:7300:d090:b0:386:8bd2:da2c with SMTP id 5a478bee46e88-3868bd2db9amr12860630eec.2.1795526157529;
        Tue, 24 Nov 2026 05:15:57 -0800 (PST)
X-Received: by 2002:a05:7300:d090:b0:386:8bd2:da2c with SMTP id 5a478bee46e88-3868bd2db9amr12860609eec.2.1795526156998;
        Tue, 24 Nov 2026 05:15:56 -0800 (PST)
Received: from hu-prajn-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385665f21aesm56371320eec.4.2026.11.24.05.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:15:56 -0800 (PST)
From: Prajwal N <prajwal.n@oss.qualcomm.com>
To: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        wim@linux-watchdog.org, linux@roeck-us.net,
        radim.krcmar@oss.qualcomm.com, anup@brainfault.org,
        anup.patel@oss.qualcomm.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-watchdog@vger.kernel.org, prajwal.n.oss@gmail.com,
        Prajwal N <prajwal.n@oss.qualcomm.com>
Subject: [RFC PATCH v4 1/2] RISC-V: Add defines for the RISC-V SBI watchdog extension
Date: Tue, 24 Nov 2026 18:45:41 +0530
Message-ID: <20261124131542.613271-2-prajwal.n@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124131542.613271-1-prajwal.n@oss.qualcomm.com>
References: <20261124131542.613271-1-prajwal.n@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfX4X7Fz36JW8L+
 RZq2Kb2+8CA4x936o5rp/Rt+rqcEohHWu/jOUJeclr53l58KuDFgoYMa1JaQBq+m2ZdYRfWpgxQ
 4o7L6XcOw6i3XXmxNpuCAl96X74h4m+/D4tOMppO2qt+humv4JKFXRk91DLcKqMi8PyykQgJhNs
 vnctGgHeZRvr7mPPuWyYqgXJS6RjogrX6L+oQNV4pbBJGAnEQEhVUmDTycvv3CgGN6Qc2PrLDpN
 Ria863E8mH/Kc85sABMAtiW8MhpcC8gzuD4CKqsaMhF47fvPSmMBoJVO5XDjpLQ8ef6bkEmgGCE
 P5fzJtBakQhhauHLdNevRCEkjg613krPBhSCmmjiRMZ6ISK+X+to7lvqerPAvX8Bzm4dUUwVydG
 HJRc/AXvCYK3BKNLMRhjPGjgQala4n/5Em+WPju6DYCrXa26U9aybd1HCrbi9bg+g5W4rqQRa9O
 TGdltpskH/jC2JaVC8w==
X-Proofpoint-GUID: iTAtKfYv0zefqa0rsp811fm2LHAiot87
X-Authority-Analysis: v=2.4 cv=MvbHeGae c=1 sm=1 tr=0 ts=6b058e0e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=JCsno87Pq3fPI6XBcfAA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA1MSBTYWx0ZWRfX0Sl/slvNp+GW
 R6PEw+jXpORy0z49P3AuzIFMSJxKwPrgIrnk6gbp5QFMvs0zqTXqFqEGW7gQz8vJKHuMC1JkwBT
 dWB6/qAZ4ugZxKTg6Hx4y4N87xdc5kA=
X-Proofpoint-ORIG-GUID: iTAtKfYv0zefqa0rsp811fm2LHAiot87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240051

Add the SBI watchdog extension ID and function IDs for supported
operations, including start, stop, pat, and attribute read and write.

Define the attribute IDs exposed by the SBI watchdog extension, including
watchdog capabilities such as MSI support and configurable watchdog
parameters.

Signed-off-by: Prajwal N <prajwal.n@oss.qualcomm.com>
---
 arch/riscv/include/asm/sbi.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index fd6266a7b339..f2b0b0c9f6b1 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -40,6 +40,7 @@ enum sbi_ext_id {
 	SBI_EXT_FWFT = 0x46574654,
 	SBI_EXT_MPXY = 0x4D505859,
 	SBI_EXT_DBTR = 0x44425452,
+	SBI_EXT_WDT = 0x574454,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -536,6 +537,31 @@ union sbi_dbtr_shmem_entry {
 	struct sbi_dbtr_id_msg id;
 };
 
+/* SBI watchdog function IDs */
+enum sbi_ext_wdt_fid {
+	SBI_EXT_WATCHDOG_READ_ATTRIBUTE = 0,
+	SBI_EXT_WATCHDOG_WRITE_ATTRIBUTE,
+	SBI_EXT_WATCHDOG_WRITE_NOTIF_MSI_MESSAGE,
+	SBI_EXT_WATCHDOG_START,
+	SBI_EXT_WATCHDOG_STOP,
+	SBI_EXT_WATCHDOG_PAT,
+};
+
+/* SBI watchdog attributes */
+enum sbi_ext_wdt_attribute_id {
+	SBI_WATCHDOG_CAPABILITY			= 0x00000000,
+	SBI_WATCHDOG_STATE			= 0x00000001,
+	SBI_WATCHDOG_MIN_PERIOD			= 0x00000002,
+	SBI_WATCHDOG_PERIOD			= 0x00000003,
+	SBI_WATCHDOG_TIME_LEFT			= 0x00000004,
+	SBI_WATCHDOG_NOTIF_TIME			= 0x00000005,
+	SBI_WATCHDOG_NOTIF_MSI_ADDR_LOW		= 0x00000006,
+	SBI_WATCHDOG_NOTIF_MSI_ADDR_HIGH	= 0x00000007,
+	SBI_WATCHDOG_NOTIF_MSI_DATA		= 0x00000008,
+	SBI_WATCHDOG_ATTR_MAX			= 0x00000009,
+	SBI_WATCHDOG_ATTR_RESERVED_MAX		= 0xFFFFFFFF
+};
+
 /* SBI spec version fields */
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
-- 
2.43.0

