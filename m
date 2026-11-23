Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426529;
	b=Qwi0+yTrN6LF6GDejgq1KVm7pi/JJzJk8BPIMxCiUEqcJrdtQc7rhIznZUPJXMBqorgl
	 V/dS9K91CseC6+b5fkoLHrkDW1/dS7P86WL679U6m/g/FrzNLCgLj0fwOZ55WULEDeGHS
	 8oOZehqusn5yPp09yW/TIeTbEqw0vZkFxt+FJoITkcld9p56l3T6hMYvboRva8tWMIlDo
	 se6UttvaqOMcdjLE9EeLaqzMAPHU4O3nmpYfRQLhbVTQhAnAMhrGuowxM9VY0E7Wph+qt
	 9otBiGCMJFMp34q1Os8Wl8b4y2J0VUwoA+V6Ujei6DrikEEpIAvrpZExNZYjqKTBjmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426529;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oV9VuRdK6ONpbV2klv7+p4PYnqvjzSVu5fAJ64E0vY0=;
	b=KvbXH6ltuQRpYIu4RQak6cbcwcFxtNsEOeWntynQwFwgZsKWO5+UdOS12X1x/D8noK/4
	 zqzUFLoSyJI6A9xI+yYUFHIgabCU0USExoTyJkowZ96qB8o/t79TnOXg0nr01ohBBCIZC
	 WErA3/Kl4ZwNI0FP+STzna3G/5rGBAciUBFAYllCXMHBEHc07jLbWe73Zj/yzXRraceTb
	 lefm3cXImwmGtXAjdJnw5Gy3C5H7xiberGo8nj36EXlOlZ4WcGNXnJ5fj725OjmQp5Ku2
	 ktj4fUZms04cNiVtu/5gIc7R5n//xnToRYAkMdkp4fl6hEBwvyUls0s9EAyFLYNGQ6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=klM0VC7n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bne1y5iX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7753C606A683
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7753C606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=klM0VC7n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bne1y5iX
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fq9x917029
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oV9VuRdK6ONpbV2klv7+p4PYnqvjzSVu5fAJ64E0vY0=; b=klM0VC7n5WRwCXuB
	EQf9P/2I+ANssHYZaCv3O75CyHJoto8SufPuBwhVDZW7pbl3eMf0f+JanYoiVP+/
	VkDqYRKO4fQauZa87/EPXhT1u/KM2m/cwLhlr29WB3NVp2Ze5P5TCcqyZO64z7Hn
	ajlRZbW92F13HxcU0/3Y3fjaiZ84E6rvIeTZvpSO2RT6lUixrvE00IMIDR+AAvhB
	CBZkBDqHtwPtaj1BaUVabYKU4+100NtxWqLjxeeLIMkp4u/5d5Sgtwr8amDUIBBv
	w1rlvq26zzTjP/3cOH8W6RjjshfY2+aMkJDJthZn2HzC1NAYO78tsHcxsrSIux1C
	utyl9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a0nv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:35:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94970ad532bso478474785a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795426526; x=1796031326; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oV9VuRdK6ONpbV2klv7+p4PYnqvjzSVu5fAJ64E0vY0=;
        b=bne1y5iXEcTwKVntWPcxG+uHgyiI2Cvmb7Rgo/TeDDKq0Wmec4NBT/G+H6ar9O/56h
         C8ZzkSj+EFxKI3E+utNblJqc1zAyzx0fehtrszvvWIkSO5xNVK7XY1+nmDr1qcBn8747
         Hhi3sB2mDKNTsZ/MYbkEtqzdmD2rIslB2CuQxU8sWj1hxMAPe10EDoFxK2ET9oWd3vtk
         P+Vqffeksk2dpCA10o4l2YgWekyVnrsbGJrU/Cstvs8wrd080MRX+heieQstxZz6cwsc
         guhPwUHLuhSrs779TZrsmvdTLgrlPBW8RaDe9doNwlY+LBmPDYqwqiA4Nz1P70L32wEl
         NJVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795426526; x=1796031326;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oV9VuRdK6ONpbV2klv7+p4PYnqvjzSVu5fAJ64E0vY0=;
        b=hNzLjff5MddsrI4o1CGYWEFBIDgpbCPL1QngybjMlqPCW1Whycrku9PKXoejQmukob
         AryMayWvJK/U97P/n+gGODcBKvT9vrmkCGzcA0nFVSUsCQUGvJo/V8swlFEr6pygwxxe
         GWz4O5RaiU9fvFHboXeV9NwljaoK30P58p6BcGuam3RV61F/g5CcB2j3w/NdvKUnh8qo
         jFSjwvkQQUDKpL6MwTrzvISMg7MXLiMJBXjbvxkxAp0hrV2UFYQQvqobIVYUG+/K7I5t
         qarqwPFDRd0AVTpj9Vm9yj2+D7F9SHbotnPXI40QlmW7mAD2c2Kyz0U3xT9nY3dzxxxe
         LqEQ==
X-Forwarded-Encrypted: i=1; AL+hErFMyqyK9OiU5H+HDTsl+l4+meuFJjP9zu2A2CNSYZMbYcZW+Nz9gKiZR9uzBKjXTtYQtJW5PO85wSQ4Pf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eAeUtj2o0yhn2DublVFS94Ua/KRa5/cW71A+YmzopX4jyRmRU
	VWLwC3j6hepYDYK/7B9viXbHZ0nUSRdQ8qeq2ihXVGp9mtW8NbVd75dpV42McOvnySGmImomq6o
	GmTZvywl29PRUhCbO6Mg1kj8bgkphnSoTp0vMWKJb5ZG+kcd0GfJRTEDBnk7WSeuEsfQ=
X-Gm-Gg: AZFdTZenKmhDq/JTdaHzlZ2ojvEwzTzPcetNXCEXwxmE3OgJK+BdKjxu32wFs4VOvbV
	CLrW2IrxyiEpuJu7+T9AdULqTnQIMPy+gFeA1Wh4O3lTULtbYfE8leWIeXzbH3tqALEGZ+Mjjwt
	4pKLb8ktiwkzrPn93buN5uEAYVgElqSPfGcSmQ7dvOvIpxIVAnXCjEt4zXeQgTemG67MDAcYBkw
	Apbt18YIqtkwFQf54xIYg95TdvZrlgdExei1SS9kq854Cbrto/yzTllYgusKRz+OYt7bKJuFG8J
	8aXA1v27MSOyec+sbGIi9s+497BQ4qYJtKHBzyR1ZKdzNQO56BWMPd5HK1OFO+xGsofwvlZSjck
	HQaul9NpQ/PQubORU7zT3PYQY+dFbA7ZlwpDgNWFfCt2IQX6IAzoealIu/Q==
X-Received: by 2002:a05:620a:4110:b0:949:a690:d9c3 with SMTP id af79cd13be357-949bab39bacmr1826863085a.62.1795426525939;
        Mon, 23 Nov 2026 01:35:25 -0800 (PST)
X-Received: by 2002:a05:620a:4110:b0:949:a690:d9c3 with SMTP id af79cd13be357-949bab39bacmr1826859585a.62.1795426525288;
        Mon, 23 Nov 2026 01:35:25 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm123208315e9.4.2026.11.23.01.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 01:35:24 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:35:15 +0200
Subject: [PATCH v2 2/4] platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC
 support
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
Message-Id: <20261123-t14s-gen7-ec-v2-2-3420a6202366@oss.qualcomm.com>
References: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
In-Reply-To: <20261123-t14s-gen7-ec-v2-0-3420a6202366@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13361;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yGa5C80ljqDLGRmToCiT2awM6F5pIsm6qxz+zCwB+uI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBAjUHzjafGA12NLrrZJiKrZISB/LMRHyr+SQF
 Locdo3iMdyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawQI1AAKCRAbX0TJAJUV
 VvHgD/9a8qQj1UCKFlXsoeOfJmYEzTTzWioy03h4wInP3FiEVrY/FptjZ7bzL31dGnmrqi3UOly
 XoO7dyWGzQk4678GL2mCw9dlcyvLDDCSnPcDqNpT6RnR5oABoeFw9QFZBqXOZYP8L5j36rSmK4f
 IRGKuP0J5iWkXYFBNiPirW/dwqBfXMygd2ELlpZmWPKCIuri41iKmqjFObm5BvHftkeVpFcUros
 pXzqkaDjARZR3kzazcjHoc5TdfRAkTyLKV2CYkr8zYpO8f9chKGFIbXAn3MHS7SOQKStYkdfbns
 Y8hRL23W5gOF/sKVI+wKJcMrIrzja9D/IhJgyx3kgOHCxAiaDDZ0QCX63nsPTWsim1WIB4YUSNE
 hRCB0qA3rmsEHQbHf8E/iHvM5/YirsU0J5R2hS6JzeLO4UmI3jUA9jKRqcy4EA1dBPLKR4nJ4cm
 +ZRgLB+1liQiEX/q9n91RbmcC7tkX5Yw4PBqLmPg96VM4H0oLNeKCqrtgqPBJy+0wCRz3zFd+vZ
 mnyDDyXYISEr0Pivm99QS52+ar1YJteHj8RDsnajKPdi/MpJlSTIxkvBPlZSRhVaoYSRmtE225I
 7hAWjdbZGe+ZkwlH8wY2lgvAovvaSocWLjdEUyYXWM0kQDaZphTAh6p9QIarTVZbTfV0y2HB30m
 HH2v1/q39OixxCg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX7XwU6T8EuWNw
 dQUeSpWk5Db1BmN3+Aa9YmBGM2LaaMKnqmmlw1gK5GFctZcoGhcup3DiXDbCHcV0ZeK/5G56Vo5
 JRb/UdvOSul8uA9YBKzwZTdrNL27EcE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzNyBTYWx0ZWRfX5KMEKazLGF2l
 4IuUQLMjngl3Yb0N/rCW4JD5wYUvAjSuJxkV47iNA47/qQepl8e7Exsj6lEfY1itKw7FcE8b9ps
 k0oH9BBJbqeVHuTGpA2KvgsbqLuwskDF9ke+NhEEsA+rPpRdAfPQuIgqMQfB/aAxKu7iLgbmixd
 At7gDaeeZtIEdAIofhJEGqFTuVarTzd69CXqggsS9Keb3iqe4eMA/29pfwEgQfsJhCquE+OGfh5
 Pa/IDpeq1ohlT0jX+K6EYOQNbKdZlCfkr/AynbKhriC9d3jVDhUqqyOn+KxkBs8cz1Lo24PRBt0
 hpgsc1aAajVYcAIdHPVK2Jajs3eAbUTTR7F1+U5FS4CmfZUVcqaJN49XQdbbRku6W1PVd4XWm4r
 cMfow2zN/ywfuzc0kZRCiiyr8doKaZP+Ab1ax5qVnjgHOol8ZILM1Aa1jkNsrY3R16009OU9dxr
 ApaV/SWFNyxZiWcVHmA==
X-Proofpoint-ORIG-GUID: EfidMfspolexSrzeIuc0FoKOu3zi3vnv
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b0408df cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=bKNFMsPk6bC_SE5WJAQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: EfidMfspolexSrzeIuc0FoKOu3zi3vnv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230037

The embedded controller of the ThinkPad T14s Gen 7 uses the same
register layout and event codes as the Gen 6 one, but a different set
of I2C commands. Going by the ACPI EC accessors in the Gen 7 firmware:

  - register read:  write {0x80, reg}, then write {0x80} + read 1 byte
  - register write: write {0x81, reg, val}
  - event read:     write {0x84, 0x00}, then write {0x84} + read 1 byte

With the Gen 6 commands the EC never reports any event and the LED
and keyboard backlight accesses have no effect.

Describe the bus accessors and event read per variant and add one for
the Gen 7. The multi-message Gen 7 reads are done with the I2C bus
locked, as the Gen 6 ones already are.

Besides the protocol, the Gen 7 differs in a few other places:

  - there is no second keyboard backlight register and, when cycled
    with Fn+Space, the keyboard backlight also reports level 3;
  - the mic mute LED is a generic LED (id 0x0e) instead of a bit in the
    audio register;
  - Fn+F12 reports its own event code (0x19);
  - suspend is signalled through bit 5 of register 0xcf instead of the
    Gen 6 modern standby register, and the firmware makes the power and
    lid logo LEDs glow while suspended;
  - a few hotkeys which already come in through the I2C-HID keyboard
    (volume, mute and some Fn+Fxx combinations) also raise an EC event,
    and the firmware reports some status events nobody acts upon.

Handle those differences and treat the Gen 7 only events as known ones,
ignoring the duplicate hotkey events.

Co-developed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 197 ++++++++++++++++++++++++--
 1 file changed, 186 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 7a875877c8f3..cc7713aeac8e 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -17,7 +17,9 @@
 #include <linux/interrupt.h>
 #include <linux/leds.h>
 #include <linux/lockdep.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/pm.h>
@@ -26,8 +28,20 @@
 #define T14S_EC_CMD_ECWR	0x03
 #define T14S_EC_CMD_EVT		0xf0
 
+/*
+ * The Gen 7 (Snapdragon X2) EC uses a different command set over I2C, as
+ * described by the ACPI EC accessors in its firmware (RDEC, WREC, QEVT).
+ */
+#define T14S_GEN7_EC_CMD_RD	0x80
+#define T14S_GEN7_EC_CMD_WR	0x81
+#define T14S_GEN7_EC_CMD_EVT	0x84
+#define T14S_GEN7_EC_LED_MIC_MUTE	0x0e
+
 #define T14S_EC_REG_LED				0x0c
 #define T14S_EC_REG_KBD_BL1			0x0d
+#define T14S_EC_REG_MODERN_STANDBY_GEN7		0xcf
+/* Gen 7 DSDT sets this bit on Windows modern standby entry */
+#define T14S_EC_MODERN_STANDBY_GEN7_ESLS	BIT(5)
 #define T14S_EC_REG_MODERN_STANDBY		0xe0
 #define T14S_EC_MODERN_STANDBY_ENTRY		BIT(1)
 #define T14S_EC_MODERN_STANDBY_EXIT		BIT(0)
@@ -41,6 +55,7 @@
 #define T14S_EC_EVT_NONE			0x00
 #define T14S_EC_EVT_KEY_FN_4			0x13
 #define T14S_EC_EVT_KEY_FN_F7			0x16
+#define T14S_EC_EVT_KEY_FN_F12_GEN7		0x19
 #define T14S_EC_EVT_KEY_FN_SPACE		0x1f
 #define T14S_EC_EVT_KEY_TP_DOUBLE_TAP		0x20
 #define T14S_EC_EVT_AC_CONNECTED		0x26
@@ -67,6 +82,18 @@
 #define T14S_EC_EVT_KEY_FN_F11			0x7a
 #define T14S_EC_EVT_KEY_FN_G			0x7e
 
+/* Gen 7 only */
+#define T14S_GEN7_EC_EVT_HKEY_1010		0x14
+#define T14S_GEN7_EC_EVT_HKEY_1011		0x15
+#define T14S_GEN7_EC_EVT_HKEY_1017		0x1c
+#define T14S_GEN7_EC_EVT_STATUS_35		0x35
+#define T14S_GEN7_EC_EVT_DYTC			0x3c
+#define T14S_GEN7_EC_EVT_STATUS_40		0x40
+#define T14S_GEN7_EC_EVT_STATUS_4B		0x4b
+#define T14S_GEN7_EC_EVT_STATUS_4E		0x4e
+#define T14S_GEN7_EC_EVT_HKEY_1016		0x76
+#define T14S_GEN7_EC_EVT_HKEY_1015		0x7b
+
 /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
 #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
 
@@ -83,6 +110,7 @@
 enum t14s_ec_led_status_t {
 	T14S_EC_LED_OFF =	0x00,
 	T14S_EC_LED_ON =	0x80,
+	T14S_EC_LED_GLOW =	0xa0, /* Gen 7 only, only works for power and lid LEDs */
 	T14S_EC_LED_BLINK =	0xc0,
 };
 
@@ -93,9 +121,18 @@ struct t14s_ec_led_classdev {
 	struct t14s_ec *ec;
 };
 
+struct t14s_ec;
+
+struct t14s_ec_variant {
+	const struct regmap_bus *regmap_bus;
+	int (*read_evt)(struct t14s_ec *ec, u8 *val);
+};
+
 struct t14s_ec {
 	struct regmap *regmap;
 	struct device *dev;
+	const struct t14s_ec_variant *variant;
+	enum led_brightness mic_mute_cache;
 	struct t14s_ec_led_classdev led_pwr_btn;
 	struct t14s_ec_led_classdev led_chrg_orange;
 	struct t14s_ec_led_classdev led_chrg_white;
@@ -206,6 +243,85 @@ static int t14s_ec_read_evt(struct t14s_ec *ec, u8 *val)
 	return ret;
 }
 
+static int t14s_gen7_ec_cmd_read(struct t14s_ec *ec, u8 cmd, u8 arg, u8 *val)
+{
+	struct i2c_client *client = to_i2c_client(ec->dev);
+	u8 req[2] = { cmd, arg };
+	struct i2c_msg msgs[2] = {
+		{ .addr = client->addr, .flags = 0, .len = 2, .buf = &req[0] },
+		{ .addr = client->addr, .flags = I2C_M_RD, .len = 1, .buf = val },
+	};
+	int ret;
+
+	i2c_lock_bus(client->adapter, I2C_LOCK_SEGMENT);
+
+	/* Send cmd + arg */
+	ret = __i2c_transfer(client->adapter, msgs, 1);
+	if (ret < 0)
+		goto out;
+
+	/* Resend the cmd byte + read the value */
+	msgs[0].len = 1;
+	ret = __i2c_transfer(client->adapter, msgs, 2);
+	if (ret < 0)
+		goto out;
+
+	ret = ret == 2 ? 0 : -EIO;
+out:
+	i2c_unlock_bus(client->adapter, I2C_LOCK_SEGMENT);
+	return ret;
+}
+
+static int t14s_gen7_ec_write(void *context, unsigned int reg,
+			      unsigned int val)
+{
+	struct t14s_ec *ec = context;
+	struct i2c_client *client = to_i2c_client(ec->dev);
+	u8 buf[3] = { T14S_GEN7_EC_CMD_WR, reg, val };
+	int ret;
+
+	ret = i2c_master_send(client, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int t14s_gen7_ec_read(void *context, unsigned int reg,
+			     unsigned int *val)
+{
+	struct t14s_ec *ec = context;
+	u8 result;
+	int ret;
+
+	ret = t14s_gen7_ec_cmd_read(ec, T14S_GEN7_EC_CMD_RD, reg, &result);
+	if (ret)
+		return ret;
+
+	*val = result;
+	return 0;
+}
+
+static const struct regmap_bus t14s_gen7_ec_regmap_bus = {
+	.reg_write = t14s_gen7_ec_write,
+	.reg_read = t14s_gen7_ec_read,
+};
+
+static int t14s_gen7_ec_read_evt(struct t14s_ec *ec, u8 *val)
+{
+	return t14s_gen7_ec_cmd_read(ec, T14S_GEN7_EC_CMD_EVT, 0x00, val);
+}
+
+static const struct t14s_ec_variant t14s_ec_variant = {
+	.regmap_bus = &t14s_ec_regmap_bus,
+	.read_evt = t14s_ec_read_evt,
+};
+
+static const struct t14s_ec_variant t14s_gen7_ec_variant = {
+	.regmap_bus = &t14s_gen7_ec_regmap_bus,
+	.read_evt = t14s_gen7_ec_read_evt,
+};
+
 static void t14s_ec_write_sequence(struct t14s_ec *ec, u8 reg, u8 val, u8 cnt)
 {
 	int i;
@@ -318,6 +434,9 @@ static int t14s_kbd_bl_set(struct led_classdev *led_cdev,
 	if (ret < 0)
 		return ret;
 
+	if (ec->variant == &t14s_gen7_ec_variant)
+		return 0;
+
 	val = FIELD_PREP(T14S_EC_KBD_BL2_MASK, brightness);
 	ret = regmap_update_bits(ec->regmap, T14S_EC_REG_KBD_BL2,
 				 T14S_EC_KBD_BL2_MASK, val);
@@ -338,7 +457,11 @@ static enum led_brightness t14s_kbd_bl_get(struct led_classdev *led_cdev)
 	if (ret < 0)
 		return ret;
 
-	return FIELD_GET(T14S_EC_KBD_BL1_MASK, val);
+	/*
+	 * When cycled with Fn+Space, the Gen 7 EC also uses 3 for the high
+	 * level, which looks the same as 2.
+	 */
+	return min(FIELD_GET(T14S_EC_KBD_BL1_MASK, val), 2);
 }
 
 static void t14s_kbd_bl_update(struct t14s_ec *ec)
@@ -383,7 +506,10 @@ static enum led_brightness t14s_mic_mute_led_get(struct led_classdev *led_cdev)
 	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
 					  led_mic_mute);
 
-	return t14s_audio_led_get(ec, T14S_EC_MIC_MUTE_LED);
+	if (ec->variant == &t14s_ec_variant)
+		return t14s_audio_led_get(ec, T14S_EC_MIC_MUTE_LED);
+
+	return ec->mic_mute_cache;
 }
 
 static int t14s_mic_mute_led_set(struct led_classdev *led_cdev,
@@ -391,8 +517,19 @@ static int t14s_mic_mute_led_set(struct led_classdev *led_cdev,
 {
 	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
 					  led_mic_mute);
+	int ret;
 
-	return t14s_audio_led_set(ec, T14S_EC_MIC_MUTE_LED, brightness);
+	if (ec->variant == &t14s_ec_variant)
+		return t14s_audio_led_set(ec, T14S_EC_MIC_MUTE_LED, brightness);
+
+	ret = regmap_write(ec->regmap, T14S_EC_REG_LED,
+			   T14S_GEN7_EC_LED_MIC_MUTE |
+			   (brightness ? T14S_EC_LED_ON : T14S_EC_LED_OFF));
+	if (ret < 0)
+		return ret;
+
+	ec->mic_mute_cache = brightness ? LED_ON : LED_OFF;
+	return 0;
 }
 
 static enum led_brightness t14s_spk_mute_led_get(struct led_classdev *led_cdev)
@@ -444,6 +581,7 @@ static const struct key_entry t14s_keymap[] = {
 	T14S_EC_KEY_ENTRY(FN_F10, KEY_SELECTIVE_SCREENSHOT),
 	T14S_EC_KEY_ENTRY(FN_F11, KEY_LINK_PHONE),
 	T14S_EC_KEY_ENTRY(FN_F12, KEY_BOOKMARKS),
+	T14S_EC_KEY_ENTRY(FN_F12_GEN7, KEY_BOOKMARKS),
 	T14S_EC_KEY_ENTRY(FN_SPACE, KEY_KBDILLUMTOGGLE),
 	T14S_EC_KEY_ENTRY(FN_ESC, KEY_FN_ESC),
 	T14S_EC_KEY_ENTRY(FN_TAB, KEY_ZOOM),
@@ -478,7 +616,7 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	int ret;
 	u8 val;
 
-	ret = t14s_ec_read_evt(ec, &val);
+	ret = ec->variant->read_evt(ec, &val);
 	if (ret < 0) {
 		dev_err(ec->dev, "Failed to read event\n");
 		return IRQ_HANDLED;
@@ -501,6 +639,7 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	case T14S_EC_EVT_KEY_FN_4:
 	case T14S_EC_EVT_KEY_FN_F8:
 	case T14S_EC_EVT_KEY_FN_F12:
+	case T14S_EC_EVT_KEY_FN_F12_GEN7:
 	case T14S_EC_EVT_KEY_FN_TAB:
 	case T14S_EC_EVT_KEY_FN_F10:
 	case T14S_EC_EVT_KEY_FN_N:
@@ -553,6 +692,23 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	case T14S_EC_EVT_KEY_FN_D:
 		dev_dbg(ec->dev, "FN + D - toggle privacy guard mode\n");
 		break;
+	case T14S_GEN7_EC_EVT_DYTC:
+	/*
+	 * Keys which send an EC event which the DSDT maps to a HKEY, which
+	 * also send a key-press over I2C-HID, so ignore the EC event.
+	 */
+	case T14S_GEN7_EC_EVT_HKEY_1010:
+	case T14S_GEN7_EC_EVT_HKEY_1011:
+	case T14S_GEN7_EC_EVT_HKEY_1015:
+	case T14S_GEN7_EC_EVT_HKEY_1016:
+	case T14S_GEN7_EC_EVT_HKEY_1017:
+	/* Status events the Gen 7 firmware does not act upon either */
+	case T14S_GEN7_EC_EVT_STATUS_35:
+	case T14S_GEN7_EC_EVT_STATUS_40:
+	case T14S_GEN7_EC_EVT_STATUS_4B:
+	case T14S_GEN7_EC_EVT_STATUS_4E:
+		dev_dbg(ec->dev, "EC event 0x%02x\n", val);
+		break;
 	default:
 		dev_info(ec->dev, "Unknown EC event: 0x%02x\n", val);
 		break;
@@ -572,9 +728,13 @@ static int t14s_ec_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ec->dev = dev;
+	ec->variant = i2c_get_match_data(client);
+	if (!ec->variant)
+		ec->variant = &t14s_ec_variant;
+
 	i2c_set_clientdata(client, ec);
 
-	ec->regmap = devm_regmap_init(dev, &t14s_ec_regmap_bus,
+	ec->regmap = devm_regmap_init(dev, ec->variant->regmap_bus,
 				      ec, &t14s_ec_regmap_config);
 	if (IS_ERR(ec->regmap))
 		return dev_err_probe(dev, PTR_ERR(ec->regmap),
@@ -618,8 +778,15 @@ static int t14s_ec_suspend(struct device *dev)
 
 	led_classdev_suspend(&ec->kbd_backlight);
 
-	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
-			       T14S_EC_MODERN_STANDBY_ENTRY, 3);
+	if (ec->variant == &t14s_ec_variant) {
+		t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
+				       T14S_EC_MODERN_STANDBY_ENTRY, 3);
+	} else {
+		regmap_assign_bits(ec->regmap, T14S_EC_REG_MODERN_STANDBY_GEN7,
+				   T14S_EC_MODERN_STANDBY_GEN7_ESLS, 1);
+		t14s_led_set_status(ec, &ec->led_pwr_btn, T14S_EC_LED_GLOW);
+		t14s_led_set_status(ec, &ec->led_lid_logo_dot, T14S_EC_LED_GLOW);
+	}
 
 	return 0;
 }
@@ -628,8 +795,15 @@ static int t14s_ec_resume(struct device *dev)
 {
 	struct t14s_ec *ec = dev_get_drvdata(dev);
 
-	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
-			       T14S_EC_MODERN_STANDBY_EXIT, 3);
+	if (ec->variant == &t14s_ec_variant) {
+		t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
+				       T14S_EC_MODERN_STANDBY_EXIT, 3);
+	} else {
+		regmap_assign_bits(ec->regmap, T14S_EC_REG_MODERN_STANDBY_GEN7,
+				   T14S_EC_MODERN_STANDBY_GEN7_ESLS, 0);
+		t14s_led_set_status(ec, &ec->led_pwr_btn, T14S_EC_LED_ON);
+		t14s_led_set_status(ec, &ec->led_lid_logo_dot, T14S_EC_LED_ON);
+	}
 
 	led_classdev_resume(&ec->kbd_backlight);
 
@@ -637,13 +811,14 @@ static int t14s_ec_resume(struct device *dev)
 }
 
 static const struct of_device_id t14s_ec_of_match[] = {
-	{ .compatible = "lenovo,thinkpad-t14s-ec" },
+	{ .compatible = "lenovo,thinkpad-t14s-ec", .data = &t14s_ec_variant },
+	{ .compatible = "lenovo,thinkpad-t14s-gen7-ec", .data = &t14s_gen7_ec_variant },
 	{}
 };
 MODULE_DEVICE_TABLE(of, t14s_ec_of_match);
 
 static const struct i2c_device_id t14s_ec_i2c_id_table[] = {
-	{ .name = "thinkpad-t14s-ec" },
+	{ .name = "thinkpad-t14s-ec", .driver_data = (kernel_ulong_t)&t14s_ec_variant },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, t14s_ec_i2c_id_table);

-- 
2.54.0

