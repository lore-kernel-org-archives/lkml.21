Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071352;
	b=IwG4gIF9XuXWn4itQozaPczGCuEzsZcsSv5kVSaFjRyHftYA0njEHcbjDBTjnHNJCQZj
	 l4Ltf9YtOW2+gTQ0krh8tAIBAX+cgywSbt1dKVaBA4BmwzIhg5M+U9/VhAWrV9ql8p33H
	 Jecqi+QIFB2CPdc6wwkYsTKdu5SiG5DlTOZGvjlbijhBWL1BCTfecCaG4Bj7yeA+xuSUN
	 VSFZM7CkDpW9Lbl+tKA4YUCgwymCi+pRQGpH17kOLVg+a181iRZu5Cj6e4xqlnrfYmEzc
	 gOmDzoCebQk58SrnWQttHBZG4mX8KmRwKjONznVxyYdhdSTNQ9vcMOJv3eA+mgGznSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8dsxubWLwG08yfXZzhW842b3VkS3W2uCpDQ4eGoW9nE=;
	b=htrlGYu2xHBo5Ao4fZ2+tmOt8NweR4Jj19HcRrTkHJ2PUDRxdXFb1+gYLIsuNXJjOk46
	 0LmtWsGHlez7O5SfcdP0YNaF85E8gAIDR7WR21C8Hf1qKTia//lZfyPaxhMdJDQDB1ct/
	 bKm/AnkeikBm7vaLIq2DDz75srXWv18An13vZ6DQb/8sAMx8a0SuHGt5lk18U98it+/Zu
	 Z+4kY2Mlz6rv2f192tSOhzKVGHnx/AyvTnr/2LQduZJflHU2T6sbdfJZutE+E8IF4HQod
	 M/KBtK3Xj9fmJ0xETEIiJayzmD+/G4tmB1l4mVsi2ZZWFiSb3HfSvDKTzrLMIi9wc9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CROp179o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bFmBf9NY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2745606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2745606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CROp179o;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bFmBf9NY
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1AwM5935629
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8dsxubWLwG08yfXZzhW842
	b3VkS3W2uCpDQ4eGoW9nE=; b=CROp179oe0PiwZRNZBJj+Katind1GaJN7Cz49R
	84PCfbPzqfRIUK4J+rOU1plNQMzk1TPfUG8y7r0CrPvlvgS5bReH9K7GY+74uoag
	mpfJJRMtV8wwXAhyvUk3REn7MRgslIMgk2zu9jVVR0rhAcYj+8/O3G35jK/piA2G
	O/CQ4AXBZyu12xi/oY4Qejekdcq9kFL0AixnVwfFxoD+7RYOgj4LYkX8yLCrNo4c
	yJINK6YySZ37+nsJf3YHnsu/KJ+lJs/zxjJFYPjN0n7CffTPZRN3qJER9R8ISh4d
	d69bMZBAOjp8PZFrnMM9CtcIvn8lnpYvHRUS3FzZ7MWAg6sg==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcsbtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 06:55:50 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-862b952fb06so1435419a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 22:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795071350; x=1795676150; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8dsxubWLwG08yfXZzhW842b3VkS3W2uCpDQ4eGoW9nE=;
        b=bFmBf9NYisK31BO+hHqTLb0JRuQQAqG2/wNXj5NAgWOs0Z2Pk2dikwDW02VMEKR+nI
         3lh9Mte/r8TXVBgQd2V6DchJ2V8EvMJgPs9rhu9SFEOvIplbDrMsb0Bs1qc5MyIl9ALN
         mOwp2j67w9lECqgZNN5dnPTYFIXS4s5C+JNSSppE/KfMhJq2mPmaA3/F1RzE1bgETovn
         DoxyGfjTMR1tmVRl+IhCBkwWa9fSSLAvYjYjMNcPXvVlzhUIXFEXCMcUcpdHVK1GcsZ3
         EfZZFEt6GpZ+z+jl9SIV5ZpVOVZxzjewWKcqv8BEA3P0jE8FMWFxAitYnA0fwLhnuutC
         VNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795071350; x=1795676150;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8dsxubWLwG08yfXZzhW842b3VkS3W2uCpDQ4eGoW9nE=;
        b=pd5p79TtdRav0VNab2Yd55i8EFeZXpjjwF4jx90Jb/Ae/+iByVT0GDHAQhqfC3yUbA
         TrYjIdItV3eZRWXHparzm4V/0TpM6MHznX4oLvrUMe3RWcI/5nyf31AKQ8PSjM6O85uw
         nVvLj7YE7cLAHfHLrFx5oPS4aL1QjTsV5baNmy4hUNlkOZ1MrIYraccmuJygk/XtJGAT
         HQbQaDGRwY2+aXiZDRuEdc2UYCiggLSM3IelbNnz5APaS+sNwRnPTKx06n+Q2UYMYAbX
         hrzOnVBgAr1sAeLoLesfD4PTCMoN+5jttpYLlM1FFMsLOtGK6ElBXu5xaTpcVk0f5eqR
         zBog==
X-Forwarded-Encrypted: i=1; AL+hErELfo15O3NlQDMRKv1W6RKbjx6UaQkaOBiujNU4DWDMiPm2Q3WHCbRHIaNGZTKrj47AHXYSvEMF0aNLqt8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LQoONw2H+4/iVcZs905W2jTy2kEy6pFfev89hFjW0ZdrdphLk
	RoWjGqLjpyd0XOObafLiG6g4gLCama5GqUvnoy7Mx9o4Llzveu6insz7FZJJ/LLAGr6wjWmKnV1
	RAYmyePi+DxS3dJGalS2AdfRmzFacRvNUxOfcOQGgPIMvHJUbUouq5wi9bYxG4wflYDo=
X-Gm-Gg: AYBFou33P4ModZNTUmeGg7BqD0gxH1DYU4MMnwSPAUR+las1dc9MQJe3acR5kUQsh5r
	vjw9/vRwyl/NaiJcNWcXZwWrBgLZ2CJKHa/ENIwpgoSNwI6NcX+BnGu2NAlbRsnnJ1djWmKp/Db
	eDpzxXPS7onKGYSoZLR9RwOXGreIo/FK8OVt0mGVWIgg+1VWORKbSdLYdibL9MirQO0HjCmi+bk
	gWLUgE+0LsOmiEQroAbJtNJoIxGjnSwjjBkAYYcrsSDJWu88FmG4hiH0EmK3GJ/+vY1erFHvHJt
	WH9as3Spq0PeD2Yb9rMJ+9tniQjS3/Koxvr0s05WIuoPFZ02Ke8RJTOfEw/8uh+CIXtczBhZOGK
	SKzoZZ8d/zLfJsms4OMUPBXuRxLUS1xXLAU2l2za0S7WofXOM6yaPnk0L1G0kcu8ZFryMoAbktf
	Lhfb2iaBEy1sLLUoK5PKMvexeC+A==
X-Received: by 2002:a05:6830:43ac:b0:862:9ff6:53c2 with SMTP id 46e09a7af769-862f08dd0d2mr5877024a34.10.1795071349792;
        Wed, 18 Nov 2026 22:55:49 -0800 (PST)
X-Received: by 2002:a05:6830:43ac:b0:862:9ff6:53c2 with SMTP id 46e09a7af769-862f08dd0d2mr5877002a34.10.1795071349291;
        Wed, 18 Nov 2026 22:55:49 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-862f00891e6sm3753070a34.0.2026.11.18.22.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:55:48 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH v3 0/3] soc: qcom: Add Qualcomm PMIC GIO framework and RTC
 driver using it
Date: Wed, 18 Nov 2026 22:55:43 -0800
Message-Id: <20261118-gio-framework-rtc-driver-2026-10-12-v3-0-52d78a8f43ee@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAG+d/moC/42OMQ7CMAxFr4IyYxQnJVRM3AMxtKkLAUrAKQGEe
 neSdmFgYLH0pK/3/BaB2FEQ69lbMEUXnL8k0POZsIfqsidwTWKhpDIoEWHvPLRcdfTwfALuLTT
 sIjHkBaAEVFC2ylikpW6KWiTTlal1z7Gy3U0c7vWRbJ/VeXFwoff8Gt+ImHdTEZPwn2JEkEAFm
 gJXJZa62vgQFrd7dba+6xbpiByO6ltt/lOrpK6NJNOS1qXGH+phGD6UGuo6SgEAAA==
X-Change-ID: 20261011-gio-framework-rtc-driver-2026-10-12-8f26c1e53d4b
To: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795071348; l=5048;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=wJTH4S7bvKvDb+Lzwk9cV4OE1JT7dJURXgBSWM0FDAw=;
 b=n+/VP5GmUTxsGlhJQt90YE7vOaM1SeI+Xlvp7ujfn8wiCWK2QoBPXfbWsGFhl1G0zzmeIre4S
 o/e88IP7xdeAGO9iT7L+l+RjUsp5cQF7AlN5eBqMRL1Gns496DiHFrJ
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: JdZvgzybTSmRNShdmoiwSOxoO3pD6U5D
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyNyBTYWx0ZWRfX33r9l8J1F4pz
 mqjqLTXCwzuP68ZqWcx0YsU4WT1LFuXqRdJfFTiEtinKAvuf0o4a/0kJxXH1NYptIh+wDN1brzq
 wPBifSQ2+UZlv3KtCymRTATOEVXfa18=
X-Proofpoint-GUID: JdZvgzybTSmRNShdmoiwSOxoO3pD6U5D
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6afe9d76 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=MAm0shQKp9Nsj77vp2AA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyNyBTYWx0ZWRfXzA7EhbRs+VlZ
 Bc/bZvclyT82c41epzIq3OTo67sAzQb1txiA60NUeQSqNQ47D+byJ3IXVAfUaBg/SRaWhayPfm2
 8FzFfrEwgmqcohogxndfb23HIkV4p6TxtDlvUrQEd3C4CpJ8p0ePLTkd6nZBKSH9ZQ/4GHmnlWS
 tjbzS3TijXv4wTG9D5mbCV7j5fcQfwWi+5ir+2VtoaFhyRB/OCy/VKK1u1BzxDPjQjySUhkAoqy
 A6In+WNJYIrMoGLCfdON97CJF8gYCeYMC99CzIu7gEWChYsrwM/xOHKaW2NBQvIZmNQVVHnq/B9
 3arnElEb0s5/VPgFkIKYYTotreS25xsg1QBFSEjqH8FyF6xk/miQMgTwnoErW3XRW7Me/7Xobm3
 nA3eQifoicGzLeF05ISO0Tdub8eBTNouKlDxfGvkyf13w0wQ3SyuLIQEgNBOH5s7IukCeD5jK0/
 oP1O9W8P/d0AuJz41xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190027

Qualcomm SoCCP battery-management firmware on the Glymur platform
introduces a General I/O (GIO) interface. GIO exposes firmware
functionality through fixed-size register blocks grouped into
virtual peripherals, including core, battery, USB-C, service,
settings, debug, and OEM, etc. These blocks require block-aligned
transactions, while asynchronous firmware events are reported
as alerts identified by peripheral and alert IDs.

This series introduces a transport-agnostic PMIC GIO framework that
exposes the register space through regmap, tracks transport
availability, and routes alerts through a virtual IRQ domain.
It also provides managed interfaces for registering transports,
state notifiers, IRQ mappings, and auxiliary consumer devices.

It then adds a PMIC GLINK transport instance that converts GIO
block read/write transactions and alert notifications exchanged
over RPMSG into regmap accesses and IRQ delivery, and updated Glymur
to instantiate this GIO client while retaining the existing pmic_glink
clients.

Also, add a new RTC driver based on GIO interface to demonstrate
GIO usage, by accessing the firmware TAD real-time register block
for reading and setting the system time through the GIO regmap.

This also addresses a concern on the Glymur platform, where no
writable RTC device is available to retain the system time during
device reboot.

The battery manager, UCSI, and USB-C altmode functions currently
provided by dedicated PMIC GLINK clients can also be implemented
using the GIO interface. Changes have been made in qcom_battmgr/
ucsi_glink/pmic_glink_altmode drivers and tested on Glymur CRD
device by using the new GIO interface, including SSR scenarios.

This primarily helped validate the function and API sanity of
routing GIO alert messages through virtual interrupts, which
could not be done in the RTC driver because it does not need to
handle alert messages.

However, these client changes are not included in this series to
reduce the risk of introducing the GIO framework while migrating
all existing functionalities at the same time. They could be posted
to migrate these client drivers to their corresponding GIO auxiliary
devices and remove the legacy clients from Glymur once the GIO
implementations have been independently reviewed and accepted.

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>

---
Changes in v3:
- Fixed issue reported by Sashiko
  1. Queue pgio->init_work with pgio->lock protection to avoid queuing work
    after the workqueue is destroyed during the driver teardown.

- Link to v2: https://patch.msgid.link/20261116-gio-framework-rtc-driver-2026-10-12-v2-0-b60e6fe33831@oss.qualcomm.com

Changes in v2:

- Fixes issues reported by Sashiko
  1. Updated to use devm_auxiliary_device_create() for consumer creation
    to ensure the auxiliary device remains valid until its final device
    reference is released. Also, updated to use the API when creating the
    RTC auxiliary device.
  2. Marked the USB-C UCSI message-output register blocks as writable.
  3. Made transaction preparation atomic with service and removal state checks,
    preventing teardown from missing a newly armed transaction and causing a
    timeout.
  4. Clear pending transaction opcode and buffer state before signaling completion,
    preventing PDR teardown or duplicate firmware responses from corrupting a
    completed transaction’s result.
  5. Moved the GLINK client allocation ahead of GIO/regmap registration so
    regmap and debugfs users are drained before the client is released during
    unbind.

- Fixed an issue reported by Jeff Roach:
  1. PMIC Glink GIO alert enabling was removed, as it would switch all
    notifications to the GIO channel, and the clients are using PMIC Glink
    OPCODE would not be functional.

- Link to v1: https://patch.msgid.link/20261110-gio-framework-rtc-driver-2026-10-12-v1-0-e4164178183a@oss.qualcomm.com

---
Fenglin Wu (3):
      soc: qcom: Add pmic-gio GIO framework driver
      soc: qcom: pmic_glink: Add GIO pmic_glink instance
      rtc: Add Qualcomm GIO RTC driver

 drivers/rtc/Kconfig                    |  11 +
 drivers/rtc/Makefile                   |   1 +
 drivers/rtc/rtc-qcom-gio.c             | 153 ++++++++
 drivers/soc/qcom/Kconfig               |  29 ++
 drivers/soc/qcom/Makefile              |   2 +
 drivers/soc/qcom/pmic_gio.c            | 672 +++++++++++++++++++++++++++++++++
 drivers/soc/qcom/pmic_glink.c          |  25 +-
 drivers/soc/qcom/pmic_glink_gio.c      | 557 +++++++++++++++++++++++++++
 include/linux/soc/qcom/pmic_gio.h      | 153 ++++++++
 include/linux/soc/qcom/pmic_gio_regs.h | 239 ++++++++++++
 include/linux/soc/qcom/pmic_glink.h    |   1 +
 11 files changed, 1841 insertions(+), 2 deletions(-)
---
base-commit: ef922b721a5e99348fc1f5801fdeb427ee14ee9f
change-id: 20261011-gio-framework-rtc-driver-2026-10-12-8f26c1e53d4b

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

