Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789675;
	b=pxebifJOcGPdGfjzDX6hrYDV/f3/p3EjZ728BXwBNWDFbjMQXelbIQVAQtv3MRguODwR
	 dbk04VoPT08KniNoqZcFd+A9XEovmawEk3EI7X57/QI+UW2GDQ/d+zGa8OL1v+v9MphBU
	 xROIbONv0eT1Hvh3taD3RzB34TDkkQUMxxmEBwNxwOm4tXRmiEkey2h3dhD6R4u3x/84T
	 JoRiBYiUpiQCimZIyiYZ9on6LNe4N4BCtuJIBdJo9c3WR/gX43FYhgjIkUjFAH+Mt1wnB
	 p0S8mROBZlcaNBZLZCYniYKUztJNkOvd7Ndt4Bc7/WOaUrZ51PzwQa7g8P18DGeAcGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789675;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=;
	b=Bxc18h19OlwK9lM+k3aGt2kQPMrEzJvOcpD69JYRN+XWE7DJgHz1A3vbt+wmapFgo7v2
	 iQ/Nzqv6LVgmrO5GMOk2n3qaorL/x8gi0DzLr6WXkrg0hVmOGWppPkvvfMHynk65FbxMD
	 /6NPyULu4lwZBYPnF6bTehP9xNFNXf+yMarGSTYxfj8LoJKNixO5nP667xT1ru2TBle5p
	 vbfUWbnC7+YryaMSkFWqVPv2CbG9jevQ4tixMEo0EPdZ6AJw5eio4K6Bguoq2zWdwx2uw
	 ARri+wcm35bsSPEVu3c2WxFHLC7PibwM+JiUjjqTllWNBV90uWyuo4XxjXHCuXwFSMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CpuxGWka;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NHxBgOXa;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464F0606E111
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 464F0606E111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CpuxGWka;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NHxBgOXa
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1C4A3320293
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=; b=CpuxGWkasThTOEJl
	vWjdj3K4FCHg10Vk1ZYTteQcS1zVGVMuXaDLIw4sLu41/sO19hPJS24lUEJ4CMlF
	PPN46Zbp1djyeDG5hSUfhjHzBWR2f6cxOjXKcuQy9IG09SFHiTid7+6/gSZ7JrQP
	gcYmjgUhmR2KHBxmW39Xlr+B2xFwmH9Avg06EjGSSnoZls/ErikXUllL7PIWz695
	cvkqhf6h/aJ2sZV3F2JIcBNwg0UaWKQS4eW8dyZLnDLUpmGg8X0PGnmj3aK11rWz
	z9NWLJgUt+zzU3Pio4Joq1yRRQrJp/izxifgVJFjC094v5eKSvZGfKZ2xiTY9jEb
	+jfqgg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf93x5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 14:27:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2f04e19d945so61657015ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 06:27:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789673; x=1796394473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=;
        b=NHxBgOXaoR4JWKE8GydL2XIysN97GmzYmuh2X8bwqP/6m+hJ62q0Cj9mlMighW2WP+
         5KZ3B7vSWZKjhxWw4Syqj3jFtX4I5BBgWDnlRZQ1+N6UYL5in+ZG4pqA81ElGp3tspEh
         T2FFsXuUUDmUw4+cTgo5hSa6Un1WTDKm3+RQQly7IfGNmknHqmjEekmat+BxVIUnjod6
         1YlcR43P1XbybIRQi+vZEYYywhTwfTCAK1+0di6ThPj6MpQnGD+Z60Tdpxp8XevkSYkH
         QAMnMwG1yfuOLlkbpI02zlxSOQr8gQLgUJ1c7aCex12wLdCJhmXprMGdbB/g0T43uGtG
         Bxmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789673; x=1796394473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMB3mkMVYyTMZemn6AiH7rHQwd0RWs1+LgrrTn6YfZ0=;
        b=M62fcpcpwddIcP/qgbJFpMoxDW2sBc/m/U95f5cnwk+medilta1oYIICH1cf2N6sUY
         CglXFclmQSfY4EFDbuaXB7Y0/OvtqhJ27T5aJTMc5BOkON07TZs8Ua0XqQIMJqGfFFRn
         a3nrUykHrPMLHJHUfpgXhVQR8oyHfsYnjMp8oxTLll2GV5gqh0P44C4Zsnoqe7kmvprF
         DsUeIcFb7g6GaeamgjVsojKhugzZQspNBM+975VlMCoQKQYmEs2RnKAelSOv4B4SnZ8e
         PcZFY5QoJuqp4lDKeVpwhnKycM7+tiqgHYTDadsTCXzpmyHI4LccpqjR5xiJvSq2PgGG
         /XXQ==
X-Forwarded-Encrypted: i=1; AL+hErGB63rnx3QkU472Pou0odqV9N6AU6vL8sLYFW25KE4MUEhfjN7MLgn94LePWsZLK7f4YWTVtOHjVEyb/YQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+N63N7wWZmXtzzZNtTOlHmC7QfsuUylG2Rmku+/ATMF1kQKKOS
	jdf5JZLm6YCmzNwq32xhjv0JxeANtGhCLNXQzP5A6J3tm6fV6WAdyG2GhEgxj00uKN6LgfChKll
	rGPhICbA/9bfrcmh+ObgYTBogKwPTi5B3IPQZMSzTVVd3BihCwREBco3vR5q+gDgPeVU=
X-Gm-Gg: AZFdTZfO4A8Jtk4DP9menII9N15s/oUHyPGzCjZAsg8sidH9jsKCaAPC+KaPhnON0+Y
	0ZT2JmX1zUvRyCAA7TzVA33KPVCudvbusChBm0cc8UHT9Gnffxtn5dDhHlLBxARoMCqY1yuXYo8
	yF1paxI4EiKHj+VU7aIN7aGU5JujbX/D59agjtpayvC1+SgjiygPYm1d0Ts/EwiMHMJ+7v6q9+P
	bQOtWVre8+ipZ/wOaKxuPZMLurxJSvM0Q9aLgGuw9dxwvw6H7iq8khfNbDCvjQjkXCHEj6hNKyj
	wIZmnFCgcxM1TGKy55FHhjohPUxOAKXUFEgWQUmOCwQWgTv4s1UY2aiZQZc87rl/7erJvKF6Jfi
	GDEh16hqZIy+9quMIc4PDV5uRT9NHt1Js66MNJo6qykcuCJwEr9ajwy9onQwLSRsGfSn8UKgPJK
	oa/xaVu1uHhg==
X-Received: by 2002:a17:902:ec8b:b0:2f0:3e5f:2a18 with SMTP id d9443c01a7336-2f03f21cebcmr205540385ad.39.1795789673069;
        Fri, 27 Nov 2026 06:27:53 -0800 (PST)
X-Received: by 2002:a17:902:ec8b:b0:2f0:3e5f:2a18 with SMTP id d9443c01a7336-2f03f21cebcmr205539645ad.39.1795789672505;
        Fri, 27 Nov 2026 06:27:52 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03ee84285sm120324055ad.3.2026.11.27.06.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:27:52 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 19:56:57 +0530
Subject: [PATCH v28 04/10] firmware: arm: psci: Add support for PSCI
 auxiliary devices
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
Message-Id: <20261127-arm-psci-system_reset2-vendor-reboots-v28-4-da05a33b08d8@oss.qualcomm.com>
References: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
In-Reply-To: <20261127-arm-psci-system_reset2-vendor-reboots-v28-0-da05a33b08d8@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Andy Yan <andyshrk@163.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795789617; l=8413;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=6+plmcxud8+1Db2wY0PyjrfTXxkmyX+xcwc3/L5lLU4=;
 b=4xojK07eLUyXKvcM0CJ1rWgr7sJ9kRK4evE0nRq9/GcL7+l5XLu9t17mwrWRdTTJLpUV03bKw
 L3gED7f5XoKBpfufDDFpM/XWOLluno6hVqRwAStEinCGUdCg0eh5WL3
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=ssWsJFX3OM9pkdoe4+guOfGPaulHOFt0GVnVlB6on+s=
X-Proofpoint-ORIG-GUID: u_MxUAzNvX8I7-d2CpwQ5bQAYyAPBxVv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXwgdnvZzSUrIR
 VAh1X1hhV70UHKb3mBOmiJEPtWpSiMhCW8poIgTBpbHYnAHjF9ZTfoCcyGqFRaciOu5Fb1mPjme
 SUEcrzbVinpBR9HKtZRBSA8YFcQp49uL7WLmwKYR60ySZGbgXrOMCidx57LNRcfR8C3eewZH4ri
 ErEBBqkEcdXVRwTN1eoq3o9of5CIApSDtyBpRqsElh6NLw7oAQ2BBHx4F5cAv1+hon5BZ0tC50f
 ofZuSM90cDilJ4e7pU3aBukCCJ6rOCd8APmTGdw5DfEs4SMwtQH5WeFgle0hBXL1nLu3xoP64wn
 HGKmtNKH1lDkocANBcc7GGLJ6kOwrkyWRUfGxnKKHs2sP1bgoucEeyPuDVlheIaPYSsN/T4Mbnr
 7JkirDyvv5sRog8qi8baBsIjqSs6qI1KYZ9H7bS53nLiW9e0F66nPVSpAtr2q/Z8R/C85Z66zN2
 t4f1q710QAQq9EtveJA==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b09936a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=ugXECOaDcIgpxkN7r8kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfX8RxTkPz+gBhr
 w4bhKHxSB+/sXs4jWO+QiNtDlarB9hKHQN/GMQyCR+qIyNIclQxjHlLFrP61aJ6UdIzq7deNUzr
 iMtkLHmfap4B8FGbu2qMOsRznueOB78=
X-Proofpoint-GUID: u_MxUAzNvX8I7-d2CpwQ5bQAYyAPBxVv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
Currently, both the PSCI core driver and cpuidle-psci-domain bind
directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
introduced, would also need to bind in the same way, leading to multiple
drivers attached to a single device node.

Introduce a PSCI auxiliary-device provider that binds to "arm,psci-1.0"
and registers PSCI child devices on the auxiliary bus. As the first
user, register cpuidle-psci-domain as an auxiliary device.

Update cpuidle-psci-domain to probe as an auxiliary driver and use
the PSCI device node for power-domain traversal. Allow the probe to
succeed if at least one auxiliary device is created.

Suggested-by: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Suggested-by: Lee Jones <lee@kernel.org>
Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/cpuidle/Kconfig.arm              |   1 +
 drivers/cpuidle/cpuidle-psci-domain.c    |  35 ++++++----
 drivers/firmware/arm/psci/Kconfig        |  14 ++++
 drivers/firmware/arm/psci/Makefile       |   1 +
 drivers/firmware/arm/psci/psci-devices.c | 116 +++++++++++++++++++++++++++++++
 5 files changed, 152 insertions(+), 15 deletions(-)

diff --git a/drivers/cpuidle/Kconfig.arm b/drivers/cpuidle/Kconfig.arm
index b88b01aa5829d..f22e18b05053a 100644
--- a/drivers/cpuidle/Kconfig.arm
+++ b/drivers/cpuidle/Kconfig.arm
@@ -36,6 +36,7 @@ config ARM_PSCI_CPUIDLE_DOMAIN
 	bool "PSCI CPU idle Domain"
 	depends on ARM_PSCI_CPUIDLE
 	depends on PM_GENERIC_DOMAINS_OF
+	depends on ARM_PSCI_DEVICES
 	select DT_IDLE_GENPD
 	default y
 	help
diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index d81be01d62e0f..03a8396992c40 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -9,10 +9,11 @@
 
 #define pr_fmt(fmt) "CPUidle PSCI: " fmt
 
+#include <linux/auxiliary_bus.h>
 #include <linux/cpu.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
-#include <linux/platform_device.h>
+#include <linux/module.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/psci.h>
@@ -121,14 +122,10 @@ static void psci_pd_remove(void)
 	}
 }
 
-static const struct of_device_id psci_of_match[] = {
-	{ .compatible = "arm,psci-1.0" },
-	{}
-};
-
-static int psci_cpuidle_domain_probe(struct platform_device *pdev)
+static int psci_cpuidle_domain_probe(struct auxiliary_device *auxdev,
+				     const struct auxiliary_device_id *id)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = auxdev->dev.of_node;
 	bool use_osi = psci_has_osi_support();
 	int ret = 0, pd_count = 0;
 
@@ -174,19 +171,27 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	dt_idle_pd_remove_topology(np);
 	psci_pd_remove();
 exit:
-	return dev_err_probe(&pdev->dev, ret, "failed to create CPU PM domains\n");
+	return dev_err_probe(&auxdev->dev, ret, "failed to create CPU PM domains\n");
 }
 
-static struct platform_driver psci_cpuidle_domain_driver = {
-	.probe  = psci_cpuidle_domain_probe,
+static const struct auxiliary_device_id psci_cpuidle_domain_id_table[] = {
+	{ .name = "arm-psci.psci-cpuidle-domain" },
+	{ }
+};
+MODULE_DEVICE_TABLE(auxiliary, psci_cpuidle_domain_id_table);
+
+static struct auxiliary_driver psci_cpuidle_domain_driver = {
+	.probe = psci_cpuidle_domain_probe,
 	.driver = {
-		.name = "psci-cpuidle-domain",
-		.of_match_table = psci_of_match,
+		.suppress_bind_attrs = true,
 	},
+	.id_table = psci_cpuidle_domain_id_table,
 };
 
 static int __init psci_idle_init_domains(void)
 {
-	return platform_driver_register(&psci_cpuidle_domain_driver);
+	return __auxiliary_driver_register(&psci_cpuidle_domain_driver,
+					   THIS_MODULE,
+					   "psci-cpuidle-domain");
 }
-core_initcall(psci_idle_init_domains);
+arch_initcall(psci_idle_init_domains);
diff --git a/drivers/firmware/arm/psci/Kconfig b/drivers/firmware/arm/psci/Kconfig
index 97944168b5e66..68e381f1a618a 100644
--- a/drivers/firmware/arm/psci/Kconfig
+++ b/drivers/firmware/arm/psci/Kconfig
@@ -2,6 +2,20 @@
 config ARM_PSCI_FW
 	bool
 
+config ARM_PSCI_DEVICES
+	bool "PSCI auxiliary device support"
+	depends on ARM_PSCI_FW
+	depends on OF
+	select AUXILIARY_BUS
+	default y
+	help
+	  Say Y here to enable auxiliary device support for PSCI.
+
+	  This creates auxiliary devices for PSCI functionality implemented
+	  outside the core PSCI firmware driver. These devices allow PSCI
+	  child drivers to bind through the auxiliary bus while sharing the
+	  PSCI firmware device as their parent.
+
 config ARM_PSCI_CHECKER
 	bool "ARM PSCI checker"
 	depends on ARM_PSCI_FW && HOTPLUG_CPU && CPU_IDLE && !TORTURE_TEST
diff --git a/drivers/firmware/arm/psci/Makefile b/drivers/firmware/arm/psci/Makefile
index 1956b882470f1..8e75a0ed6f740 100644
--- a/drivers/firmware/arm/psci/Makefile
+++ b/drivers/firmware/arm/psci/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 obj-$(CONFIG_ARM_PSCI_FW)	+= psci.o
+obj-$(CONFIG_ARM_PSCI_DEVICES)	+= psci-devices.o
 obj-$(CONFIG_ARM_PSCI_CHECKER)	+= psci_checker.o
diff --git a/drivers/firmware/arm/psci/psci-devices.c b/drivers/firmware/arm/psci/psci-devices.c
new file mode 100644
index 0000000000000..d23befc490ed5
--- /dev/null
+++ b/drivers/firmware/arm/psci/psci-devices.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/array_size.h>
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+struct arm_psci_device_info {
+	const char *name;
+	const char *of_node_name;
+};
+
+static const struct arm_psci_device_info arm_psci_devices[] = {
+	{
+		.name = "psci-cpuidle-domain",
+	},
+};
+
+static void arm_psci_auxiliary_device_release(struct device *dev)
+{
+	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
+
+	of_node_put(dev->of_node);
+	kfree(auxdev);
+}
+
+static int arm_psci_auxiliary_device_create(struct device *dev,
+					    const struct arm_psci_device_info *info)
+{
+	struct auxiliary_device *auxdev;
+	struct device_node *np;
+	int ret;
+
+	auxdev = kzalloc_obj(*auxdev);
+	if (!auxdev)
+		return -ENOMEM;
+
+	if (info->of_node_name)
+		np = of_get_child_by_name(dev->of_node, info->of_node_name);
+	else
+		np = dev->of_node;
+
+	auxdev->id = 0;
+	auxdev->name = info->name;
+	auxdev->dev.parent = dev;
+	auxdev->dev.release = arm_psci_auxiliary_device_release;
+
+	if (np)
+		device_set_node(&auxdev->dev, of_fwnode_handle(of_node_get(np)));
+
+	ret = auxiliary_device_init(auxdev);
+	if (ret) {
+		of_node_put(auxdev->dev.of_node);
+		kfree(auxdev);
+		goto out_put_node;
+	}
+
+	ret = __auxiliary_device_add(auxdev, "arm-psci");
+	if (ret) {
+		auxiliary_device_uninit(auxdev);
+		goto out_put_node;
+	}
+
+	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy, auxdev);
+
+out_put_node:
+	if (info->of_node_name)
+		of_node_put(np);
+
+	return ret;
+}
+
+static int arm_psci_probe(struct platform_device *pdev)
+{
+	const struct arm_psci_device_info *info;
+	int auxdev_count = 0;
+	int i, ret;
+
+	for (i = 0; i < ARRAY_SIZE(arm_psci_devices); i++) {
+		info = &arm_psci_devices[i];
+		ret = arm_psci_auxiliary_device_create(&pdev->dev, info);
+		if (ret)
+			dev_warn(&pdev->dev, "failed to create %s aux device: %d\n",
+				 info->name, ret);
+		else
+			auxdev_count++;
+	}
+
+	return auxdev_count ? 0 : -ENODEV;
+}
+
+static const struct of_device_id arm_psci_of_match[] = {
+	{ .compatible = "arm,psci-1.0" },
+	{ }
+};
+
+static struct platform_driver arm_psci_driver = {
+	.probe = arm_psci_probe,
+	.driver = {
+		.name = "arm-psci",
+		.of_match_table = arm_psci_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init arm_psci_init(void)
+{
+	return platform_driver_register(&arm_psci_driver);
+}
+arch_initcall(arm_psci_init);

-- 
2.34.1

