Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999797;
	b=NQEVJ/HyF8vGMIj7wLcsZMAAPQVXw7hLhwMrsKIg/hxfyszG7yW03rlI9chZFH/O9NrO
	 wIehKbDT/hgthT789+GJ+/kP1IdyiM8ba3BpqLFEFkF86rF6mx+0zyq5O6/UXnRMXFHh+
	 icjlHB+bMfTJwfbxoXe6E7uhSXIPkUKQMAzyf9Xk6ejJBaG3lJewcHIIukzFuTLl0wTUE
	 WuFKuWIHdXh5ucDh29dOs1T+FeyPblGUf0IL7wVkyfvV1bk3fcIyK6kR56syNPMPeFm47
	 ierQ8OLJMt3Je4js1XnygrjvpIrs+/ihQTonGqQYoxA0yU5wNe3mq5yHOG+d33fqmEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=+K2pYzrSzwUxMMnkY7CTMkYgFs7aME1tmW9XHAvfhTk=;
	b=G4f4wyN2TDeNzSxzS58M0ctB1ys3U0URIbY+PDdwdTR2r2C7wZiGeALFsS77coFbsI9d
	 hhu45bKa5PKaZTH1mY4NoJzFrGq7MOb+Pxd2tN0IdHD4v6hl3rcwPueMhvmf94OOg5Jff
	 Jr9kuNppqNXfkrm0L7ug443nVIN5vBhQmj/WW2tDXKtHd2AJYqIKP6zfldansZmYQkpw0
	 q0w5FKnCwB8hPFaxtah222qYw4PkiQ0akQEnetWLjOYRc4yT+ti7DJP+mSxpWi8GbckqG
	 tGH7N/hNc58JqswcXoKjAKpTWi4gvEdslx/iisWnylwHHIg61sgBrY2qiNnNOMfrYBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZHyOSZ+E;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=husmlsNz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD26606A33E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CD26606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZHyOSZ+E;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=husmlsNz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI9kJtZ3420213
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:03:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+K2pYzrSzwUxMMnkY7CTMkYgFs7aME1tmW9
	XHAvfhTk=; b=ZHyOSZ+E9guZ8WWQUq2afeQVkrJWBGrHZllCFTau3S3uYOAMn2K
	DORIyzqXYBTpNGF0FHX4xkVznIs2MksGJq3qzyMCema9fCNxed6TFf9aRpQcWeiG
	BTh0I64wgaX+jZSCfS/RIQBo4HTJ1vRKGdmNDAiICjt827S3PcctFrvu/tzolytz
	Pg9itfdNfKdZiIWDE+XNUR/At0rnsisVF+cJLNcRC8+n+D9/+IkKl37H09VwWHfF
	W6CPF9SXiX4Yzu3FOYWpvSF2JMgsTElU4Exz1VvEM8alRfpqAAMbU6RJZSH7XIBQ
	ldyemaH+ztZv2UKIYDnsFYl5186oxxjLvsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9apgs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 11:03:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so182749985a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 03:03:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794999793; x=1795604593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+K2pYzrSzwUxMMnkY7CTMkYgFs7aME1tmW9XHAvfhTk=;
        b=husmlsNzENkNQymmpfyKIUxs+ikcMsqdE8ZNNvaxfY8YpDgG27peeDxFi2zB1kgkV3
         klzAMFHeAqMBF6mG05QtckqrQWKoIsl/FdoZZ9HnE6Uwt6vh84Xpd2Maga2EKCA9jspz
         4ewraW2F5ey50h8lCiqaZYjRujlosLjLmEdPXrfc5Zgmc4rMegsBCD2gKBSDTZcVQQrQ
         uXxYbRXmPHUa4rvXSQh3ZKfOIjKo1g97xAyRsyOktBV1WTu9CVq1uNloLKfs/IJDwDUJ
         owksh5Ria7hd6PBAF+saa6iDdSXBiK37lWCyWTqeqWf8qzLCN+V4tiAYe3dHf+YmnvDH
         iBMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999793; x=1795604593;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+K2pYzrSzwUxMMnkY7CTMkYgFs7aME1tmW9XHAvfhTk=;
        b=RfeLXA9E+esP3o24IdFUluvyuMaocOUUcH+0wJ3Fqlfhyr3eM3vEUrM4zWUlDIU5SR
         ysm9soUUirDtSjcIqNyYOGXm8ejaieVg1lSC/NHb3nWmeHUxmKCvW34QrDQ+JxIVO4Pi
         n3+jYfqiUm25zMK9LQwYe3ZhcDWSvwFxicsOTKJTFkdXyVeVJn2tYNvBFq3m6HTMON1g
         LyGOesy2oeXZG1vFJvk/ZEKrxQ44kfyEMVLnJtLOSF4w3XTITL84jnG6Kwq7j6Qf+rtD
         z7rVb7srWmNXX56cIM5dq2dkyL7KMrRnY3kHHmIEDLM401FUAXb+fwgazdEaVjHOPojo
         r0LQ==
X-Forwarded-Encrypted: i=1; AL+hErGKvrCDy+w1PK5KyxVdKkDrQ8cbCnR151Y3pgMRuB/PwQ6pbN2cj8waEfeYtJ9QO/w7Ib9e6MNdsnoDzl8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+hJdFFrxtzX8dqFOhAhgozw1BH/jS8XuoyN6mNRRjJ5B7vtPGx
	vvxk1YGr7R/bLuUeytHZsiUNc4GOybyqDw4Qi1usGbfbjYufOg4cGl6fF3Y28qGdz9d/polDOGM
	f0nSTdBffOJHy7nFFhoFOHMPDI7rgJL7gFzbvJ285brEmK2errNbOYPGRBiJRUe5ny/U=
X-Gm-Gg: AYBFou0qGMok2pM8Id60traLwzClLmcJSq5I0o9HESrOZoaTBJwH3fMI8vG9pQHvaTQ
	8UZBk6zuo1bzTqs3eb83q2LNZsYKLp6C7wP0YWeXzX0dpDY71WMpvDU7O4e/VxGc8gu/LAy3wGX
	yBlC5u7f+ByNgWYsbUklhnYibYBMz9yBUezvBVCE6MyBayQFcDa2OHzmxgUnY7lVHDDV0aye5iz
	k/loqPh8Bii1giXuC9gpOEjHAsLJ7FsWYELUXQoNnL1mQjxhUr24t6GVT9L5tiEkc6m9KOu94h0
	5qmah+qWDwbLKUFb/toIY9rykHUCwQgqR7lgvMy5LKdO1nfNmOI3h1Yk5M9zgU5s/kPariMQjqm
	WRXjANriiQQKtF8dF0F/WyMgFYwPHoieJ7zlZhc2FYLwwi9shJVw4zP8FyZ0XLr6kdwvJD+Ml3f
	t/
X-Received: by 2002:a05:620a:4623:b0:945:d7a8:c5f4 with SMTP id af79cd13be357-949995f9546mr417394985a.62.1794999793494;
        Wed, 18 Nov 2026 03:03:13 -0800 (PST)
X-Received: by 2002:a05:620a:4623:b0:945:d7a8:c5f4 with SMTP id af79cd13be357-949995f9546mr417391685a.62.1794999793061;
        Wed, 18 Nov 2026 03:03:13 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:d355:fe70:14a0:ac8d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2b74d6sm57852995e9.9.2026.11.18.03.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:03:12 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: rafael@kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>,
        "Mario Limonciello (AMD)" <superm1@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] platform profile: Restrict the core prompt to COMPILE_TEST
Date: Wed, 18 Nov 2026 12:02:54 +0100
Message-ID: <20261118110255.2946563-1-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0MyBTYWx0ZWRfX/6/HBIFE/Cup
 M/yQQZpMY5BwH4QaHflXl61pHv8I2QITt55P4Qvj7LwDJbzTF1hUPuDkY9oQ+5F0Vfx1J7RTndX
 dVl8RaTdDgWiTqOoAECEeF6dX4cgpv0=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd85f2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=tBb2bbeoAAAA:8 a=EUspDBNiAAAA:8
 a=eSez5piW9hGb_tCy0SwA:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=Oj-tNtZlA1e06AYgeCfH:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0MyBTYWx0ZWRfX1ui1SQ4/5rer
 ZXEAMATUthifqzV/FKokrDI7mcqHqmURwj4xIAHnechD7NQQti16+o5PTwR5l5VXsjnf49mOJfa
 vsRthRCeaqgpC69dAJL6YPJtHvx3eD7FWMAOKf7MuhuLzQ3+ymChkpECvyLY4BGad0RoJzq7V/6
 PrTiY2XTzcsfrjteprVSWZHtPUr5skGWK/6KS16vBeB+dUx3PfWRMnH/Ja9dVwrqiduYYfEamkF
 qjHyxBekyRnHUunlmJdK8RjVmHfs58lzogjUpOLmLxSDdSuyjl+ZEO6gYvYG0C+1N87gDn5Ijpt
 g8BfJXSFX6hs1QzdyYyi8sVO+bN/brfceCuqAZVo0FNB4JdBNrII+kCCapoU9+wCmyqDa8TFUHC
 VIys1jo+8mc35yXFNdFkjXVDpDlBtukr3r4lO7vmlIYkXw6uUI8GOqUZT8xi771NqsoyTLtNIbK
 FLcmI4ZQsTtQJOmpDOQ==
X-Proofpoint-ORIG-GUID: pnE5uXCAQJ5dPBBzHUwnTMFvu2fdX0L_
X-Proofpoint-GUID: pnE5uXCAQJ5dPBBzHUwnTMFvu2fdX0L_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180043

All platform profile providers select PLATFORM_PROFILE, so users do not
need to enable the core explicitly.

Only show its prompt when COMPILE_TEST is enabled. This avoids exposing
the option in normal configurations while allowing the architecture-independent
core to be build-tested without a provider.

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/platform/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 7270f24a3b6e..1cf87904afc3 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PLATFORM_PROFILE
-	tristate "Platform profile support"
+	tristate "Platform profile support" if COMPILE_TEST
 	help
 	  Provide a common sysfs interface for selecting platform power,
 	  performance and cooling profiles. Platform-specific provider drivers
-- 
2.43.0

