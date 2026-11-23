Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452187;
	b=JRzRDNtH4fp0ppu78Y9iBmoyvqNz5Hl3YYZh3//AbgyWkmOTgamLL2G68YJbVV+4syxy
	 n2JfZ0dHsTC+HMact/oS6y/ZAb2EsfI/ojxDnn5itwaLuSXa9ylM21Ph8f+XPHApkZB/1
	 UTLDI/QsFFTbldDhsHlt/dHo1gcGkCXyxb4kfKFu28Q/vunUJh3VtWNhJo+98c9op9dbM
	 jkQGyRNL2DHPeek68Z2thrmofI1j1Wlq2OvG7slvLpvmGZG0V1HefsFJMM/LBeGUy3sXx
	 uc3dC7hcpmxvc+uOiiMBp1NjsVeb/b8YFIuztrkG1oVApwj5XxKxbXYKuuPzX87eR6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452187;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fcVhwGNGEDbkrG268cH/it3jO0ipQUHOtEv4oZrCYV4=;
	b=mmsu3HVQ+3zNlB1B3AFEW4pktSvj9PObQkmXiwfCDtscX8V35A5p8520O6rfLw8p6OGc
	 vOy0AOpc6rcT6p2owkCLMNz/bbnTfq8962cYHjHetUGYKGRfxCLz7IZtL4dKA5GUUlbFx
	 fV5F2dA9zlCoJKEFAPCM55df3MulTBLl7xuEyZOeepvZOrUIG69LXZeadSLfHdmhi5kQD
	 xyaF/+81Ms4+5FoMAQifvgUan1mujjZC006tNSphhywChD1cCbnufueneHNCYhwOSGyCx
	 TMCq2vmp1ZC+N4pjPCHlJ6Y0IVmsYhsKvTab3OpNqSSF0Js7ceXr8h4jvrv42NuT4uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Afw4t7Mt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Sm96VJn/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7BD606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD7BD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Afw4t7Mt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sm96VJn/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlhv3730160
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=fcVhwGNGEDbkrG268cH/it
	3jO0ipQUHOtEv4oZrCYV4=; b=Afw4t7MtUxa8Qov8eQ9L4lq6ezGyeUEseouspj
	krKMoXo2mrkY02EZSRjF+izliAY780yCyRH36uh2EVmpsJeV6mj3pytdZauHJJDU
	Nebz99labw2OJyLP6EDodcPyW7AQNcrBI6ofWN4nJcrGjtrxPixG0NaAC8rE1a4f
	bWSQew5VN7VLftqq3G8vHqBIJb6/2OfihSvzH/h62Igi+qUPXOr5JRpjW6gnYOvV
	W1ZOXqeuqJSJlzgqhUWt1m52rBZexVfJ50z+KGtzKlrcc0bcen9qtc5ocVKLjgrU
	9oFKos1FiZ2rx7invxBODdkjbZOivYNd9hikFhhMfmJvQnXQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2eeg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 16:43:05 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eac41ff334so2918789e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 08:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795452185; x=1796056985; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fcVhwGNGEDbkrG268cH/it3jO0ipQUHOtEv4oZrCYV4=;
        b=Sm96VJn/nS+ftEAnyeCEog/FvM6PZfILG9EsQM7bxQZocl9X8nahBAKcDndiLKNyTo
         S+d+fZRfHmB4SjLik+4vjD7i3MRNTwR4b1Qu3+w1mwoaXPEwjjudKb/do4znB/qh9C0p
         ES2BmpGBcPARpyxgO1dSIRK70qiX8i7zWev34vIrZdWygUrn0Z8KawBWlO9qQL+AaCLC
         vU9LTjVSN4oQhJRQKgGmHyA4/pFuogJM2l+LbcSDLhEaPo8EQ214txqJg77opfQwrUE5
         cdtno9lcM3eNo+lpEIqC8jB8r6OnOT/GkY/kxHvbQOODsuLmJ9fgbcHPBkq4nU7CFrJ8
         +xmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795452185; x=1796056985;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fcVhwGNGEDbkrG268cH/it3jO0ipQUHOtEv4oZrCYV4=;
        b=u2BVdYDt7GIFNQj9+TOVZhgvZ8DFezcOYP/l3/J1Lg+MmtgHrNtKuTSnr27B/ZOBkv
         xgT9WFMUo2zkTG0amnnVHBQzVdR8zMaivjIELnMBMrOIGN8PmTp9lBOf4qb2t7HX1X2J
         ZhUcapYfhMVy4TLUOLwBwXNC1zMjDELlsvq0sYZ/KR/861sTg3lvsuaZ5b0B7DQj54vH
         zaF6I7vniTlwKxksBm3LfxXhGNTnY8rfI6COxMv1M+OjZAKoXjO1Wgo73LJZTpRJAJEJ
         5p2G9YfkPXVM1Cipd9WHQqDUCkOoHVQP5E0+gKZEhyEwH8p2dqVBVTGXA1hXH7rZ2q4K
         KLYQ==
X-Forwarded-Encrypted: i=1; AL+hErGazGsXwOP5q+7XemsCXR0bEdczB587T2GALfuHVNNo3lbRFsyJSc44S6SuEestByiJnX7LI1OqsNkPsrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BXc25rZXhboxnRmQz7Ccm4ce3X2LH67nW0ZBPJ1pJcUsQ0Xtk
	BfGRUU9gnjg4gxVRhCAIxRqF2rdpEnp7lV5csh8KQDwIKA3x/iqwpQw9ZkHpvbjyliUV7rUpa7v
	tZ1VObO75JdNwYdhCxMKrwGbVND5v4lCTS1yeNbOr7T/59osAwjUUNpcE9KI3v81zqAs=
X-Gm-Gg: AZFdTZc6oYY8LWJG4Tq9XThFOoutsw/c/jfqcu/hG/Lx4XDCyC8VMiUoww2ZlIU9AOL
	3abIpyUEGmN/sUqmLPiqvqZB2cRYX4Dp3/2H5T6e/OsGSBPEXzDNX07y3NOPkweYlBRwTGI7HfN
	c+3O61QHOg6oQjjoGdtWkRdx0aSA/1j2yCAPpFsyQOSO2rh+e4usrQ/SBad6T7JY7JVr3Y5VKp+
	3HQy34k7IQXp0+Bay7LxlrfGIGU73SLj8qLbAAkuLnKCzd66y9h7MzWm8ihBkKs0IEezR5Drgop
	BcLipH6NfhMUsOJAhtQMrKpX+UZDZJfJJBhR1SWyDdYE+n+rdW7pMXFpfmcCnjjeb8Vk4kJhIUI
	DNtONJSzKLVUzDRF84ptSNPeIfwfTr64H/TShg2r96UFSx7Ccm6PcGXBoI2WaCNdSccJ5kHAQKC
	Dr2QUbU043H3FT
X-Received: by 2002:a05:6122:e14c:b0:5ea:c37b:450 with SMTP id 71dfb90a1353d-5ee8af9e1e0mr6466003e0c.20.1795452184794;
        Mon, 23 Nov 2026 08:43:04 -0800 (PST)
X-Received: by 2002:a05:6122:e14c:b0:5ea:c37b:450 with SMTP id 71dfb90a1353d-5ee8af9e1e0mr6465964e0c.20.1795452184261;
        Mon, 23 Nov 2026 08:43:04 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b00117dsm426725366b.80.2026.11.23.08.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 08:43:03 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Subject: [PATCH v2 0/5] arm64: qcom: QCM2290: add the Embedded USB Debugger
Date: Mon, 23 Nov 2026 17:42:55 +0100
Message-Id: <20261123-qcm2290-eud-v2-0-9bfc432dee07@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22MQQ6CMBBFr0JmbUmnCEVX3sOwKDDIJJZCK0RDe
 ncrazc/eT95b4dAninANdvB08aB3ZRAnTLoRjM9SHCfGJRUFSKexdJZpS5S0NqLGgnlUJiaygG
 SMXsa+H3U7k3ikcPL+c8R3/D3/u9sKKRoKyx1W6MutL65EPJlNc/OWZungSbG+AW6blr5rQAAA
 A==
X-Change-ID: 20261114-qcm2290-eud-81e10f3a8e5f
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: HJpUXG5wyGPAL7xw5lzvbv9_MzF6YTvp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX5bDX37brUsfV
 Em/8QKXtQMnB9/WM63IuKyw/EyDqquiPllj8tHTA6KcXs3clwRoYZHliomdiE9z4PoKVh35YjWV
 LjhleeLTGu1jm40HD11iSyYA7SqMK8aQawnIPnmCx3Bbr/q4kXQVYwQRsfLaN0r3BCGuC5VcM8P
 BWK8rKQshRUuLNLA9a+jDsMLZGzAAgZPF8WisOE/u42FVdNgoezP0+uAB4DoS7LOsXgw7tW9Z7F
 77Z0KUlHGnVZ7J3cSt1bVgBz2cXRBR8AieSzjrFaAl8QCO+FMtxoFhRejLn1AhDF+/ZMQlX6y4F
 BhYaH0juDgN4RPgE3yjsxwkKj9Dxsi47kQp/pfhVQvt1D0gJvngROdsgU/aOmBTpD/q0Jbdi6f9
 BtS7iUkob/NjEpnmSYLrbzUQ8V7zyePxdqhiNNnwQpyfDq1t2Imajmpd0g9OlUAIi4wb8VJRhqu
 9TNnrS8GKi0P+gNw7Bw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2NiBTYWx0ZWRfX0Tnem4fW7lvV
 49zu0ddhvCo71oWuvkB30UpssTyusxBQASXOxKo3q0PaWL87O0hdyYgAfCRloUz178hKoG6BPUc
 n3nygMuTd+Uv42Uw7uRMl5Gua0u/7m8=
X-Proofpoint-GUID: HJpUXG5wyGPAL7xw5lzvbv9_MzF6YTvp
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b046d19 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=b45o4kL6AAAA:8 a=dAV_Tri6AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ibbWKvYsyCdnmY7Y1RYA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
 a=dhdsR-PFWuPJUldTnwXm:22 a=jmfqb_Px-22hg6zlGo4Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230066

The Embedded USB Debugger of the QCM2290 is the block the SC7280 has,
with one difference: its mode manager ignores the enable (EUD_EN2)
unless the TCSR register TCSR_APSS_SPARE_REG1 is set first. XBL_SEC,
the secure part of the boot loader, does exactly that when it enables
the EUD itself.

Why Linux sets the bit and not the firmware:

- XBL_SEC runs the sequence only when the device's debug policy (an
  optional signed image that enables JTAG) asks for it. Without one,
  as on the Arduino UNO Q, the board boots with both registers clear.
- The stock TEE (QTEE) does not set the bit either. It allow-lists
  TCSR_APSS_SPARE_REG1 for the HLOS secure IO calls next to EUD_EN2,
  with the same policy (write allowed when secure boot is off or debug
  is not disabled).
- TF-A does the same on Agatti [1][2]: TCSR_APSS_SPARE_REG1 is open to
  the normal world in all builds, EUD_EN2 in debug builds only.

So with either TEE only the driver can complete the sequence, while the
secure firmware keeps deciding whether the EUD may be enabled at all.
Where EUD_EN2 is refused, enabling fails with -EINVAL as before.

Arduino UNO Q (QRB2210) was used for testing, next-20261112 plus the board
support it needs and this series. The registers were read back through
qcom_scm_io_readl() with a debug patch.

TF-A built to allow EUD_EN2, three enable/disable cycles:

                 write   "enable"   TCSR   EUD_EN2      host enumerates
  enable         ok      1          1      0x01010101   05c6:9500, 05c6:9501
  disable        ok      0          0      0            nothing

TF-A release build, which refuses EUD_EN2:

                                    write     "enable"   TCSR afterwards
  enable, clear skipped (as in v1)    -EINVAL   0          1
  enable, this series                 -EINVAL   0          0

Stock QTEE + Gunyah (secure boot off), two fresh boots, two
enable/disable cycles each:

                 write   "enable"   host enumerates
  enable         ok      1          05c6:9500, 05c6:9501
  disable        ok      0          nothing

With v1 only the first enable per boot attached there; now every one
does.

OpenOCD master with its EUD adapter plus the SWD fixes in [3], TF-A
built to allow EUD_EN2: attaches over SWD (DPIDR 0x5ba02477), halts and
resumes cpu0. Without [3] the EUD's SWD function returns USB errors on
my host, with the kernel that worked in October as well, so this is not
related to the series.

Not tested: RB1.

dt_binding_check, dtbs_check (qrb2210-arduino-imola, qrb2210-rb1),
W=1 and checkpatch are clean.

Elson Serrao's pending EUD rework touches the same binding and driver;
this series does not depend on it, whichever lands second needs a small
rebase.

[1] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55733
[2] https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/55964
[3] https://review.openocd.org/q/topic:eud-swd-fixes

---
Changes in v2, all from the Sashiko review of v1:
- Binding, driver, dtsi: the TCSR register is no longer a third reg
  entry of the EUD node. It is a "qcom,tcsr-reg" phandle + offset to
  the TCSR syscon, which already covers it.
- Driver: clear the TCSR register again when EUD_EN2 is refused; it
  stayed set before.
- New patch 1: clear the enabled state on disable (existing bug).
- Link to v1: https://lore.kernel.org/r/20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com

---
Igor Opaniuk (5):
      usb: misc: qcom_eud: clear the enabled state on disable
      dt-bindings: soc: qcom: eud: add the QCM2290 EUD
      usb: misc: qcom_eud: set the TCSR check register before enabling on QCM2290
      arm64: dts: qcom: agatti: add the Embedded USB Debugger
      arm64: dts: qcom: qrb2210-arduino-imola: enable the EUD

 .../devicetree/bindings/soc/qcom/qcom,eud.yaml     | 25 ++++++++++
 arch/arm64/boot/dts/qcom/agatti.dtsi               | 34 ++++++++++++-
 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts |  4 ++
 drivers/usb/misc/qcom_eud.c                        | 57 +++++++++++++++++++++-
 4 files changed, 118 insertions(+), 2 deletions(-)
---
base-commit: 84abb955b1015477aa11a96e2f3ac1b938b77f48
change-id: 20261114-qcm2290-eud-81e10f3a8e5f

Best regards,
-- 
Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>

