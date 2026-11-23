Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429539;
	b=gqEWZE8x3B1+3uftT2I0ybr3riB+CoY8jCwL6tqIXFgXxF3p1Nbogi6ajbgcMRm0fVLo
	 PwD73rWYppEkoNDTPAbAo43CEN8n9n7YSyipSX3/EaFz6kMtRxT8zhMouyFX+j3eMCy6c
	 zyROB70irtKTPIyshYTFTRII5/XTcIYH9/z+QddO624purOaxDmEfgeS6MXA4qXHwE2hC
	 UGs6+ohNGe8uDKqXQU39fw8R1l9wsZF8M6YZHLkxATZumbA7dmDEQoUrdy70BySa23Njd
	 C9pfy3lH9f4VLl45Y+JuWD8y17teA2Z8XWfob+1EQv3HTYQtr1a97F4ILn4DeWKJvsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429539;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=THgzxQz2Mg88/jMiZP/HsQu33/8nC9mZNRYAzZhoth4=;
	b=Wb+hhIurWfOopuFdQruIgEjRHJnTEY/ui5jtYOk5hW/OjJ82jM65S9BbgY0C0jJ9DA3F
	 3pCmOk4ZKzANIfg7UEjbo9khUgfyYJFEJPIM+ZLo7AVsT7ugTlMKEYwKIjUTOrJiTdDdh
	 268AHFyFmMy7jVg6JyAEektWVEhXf+6tAi6+bkNs3teH+LpUMeWZuIbesPruNh49ujE4k
	 bJY5Bl029UNbEcNeDulM03zbucz3mt93ZgsWymMWneYbBLAbUucLq4+k3vJ2S8sFbXGQA
	 XuPLV7eoS6bNFe71PmGWaW39553SQgaJOnjgMViIF6DIUQOMTUV4PdAbgbVyEmggw8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="GIl0rVX/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kq8B4sfn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2BD606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C2BD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GIl0rVX/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kq8B4sfn
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GDKf1900214
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=THgzxQz2Mg88/jMiZP/HsQ
	u33/8nC9mZNRYAzZhoth4=; b=GIl0rVX/4v3uVNRqPF5iLinhOXxWLRwRC7Ck9A
	hDsNJis/zWGyZjg0bZGO3Wd8zhqo6REYFqU7pEyb8S971QKRvwCT5vvjl5A5cQa8
	fM8ra+lS/3I6t+fSQ0L4qBVMSitVfdfQoHuC7VtLmjHb6oJ9qG3wj5wl5Mk3PUDP
	fM0PcDWhjLA4VmSdcZ9S3TR5jKrE7VefCo6vavbTwkVzeoe6GshH7TlKDxGHgXji
	Gd9ZXgf6CSxrF2SE3IaOg869UwzpGbblLs9KQ7kye+4Wjc6WQ0/k0ncCu5LKiqrM
	xVvNvVwFtyAf4uZo7iUyWasxKlpTwYP3tUncKixpbEAuJreA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k0xhq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:25:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-94960131befso486112085a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 02:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429536; x=1796034336; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=THgzxQz2Mg88/jMiZP/HsQu33/8nC9mZNRYAzZhoth4=;
        b=kq8B4sfnSesJ6FsVn8IZsTA1XWt36SMq0H2hrIypn505PDhMs8LErgpgWuMLmKAmyB
         NzpAEgxAhoSHTeqVEIQsjY2s8kUgmL/avmYyg/HtWFJuJsruUiEvqw7QvPrFuKgHl9Me
         Evq0lv9WdzVYeC1e22IZuXwIYojS4G++I1GQ+NvxTdGX165R3fgyhjdVPGlMf7pz0PSr
         mo0CLMvFdyDn4PSf0plcrGWf3LzCJ47uyTrM2mqEigiKAqj+duvCXeKeTEWcUqy4ueDP
         oaxTrlp9x8FQS5ZnnBI5+1jxdDvHDAwuz3m0oR3Er7bdtYiNkz/g/5i+wQeOIYx2Au4n
         DUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429536; x=1796034336;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=THgzxQz2Mg88/jMiZP/HsQu33/8nC9mZNRYAzZhoth4=;
        b=qnNU4cGYwP5VSs7zdBneiVlY+rfN0a7lHcqV0YVLFa1oE7puIkzKaNMkWq9cHI09PV
         GDyWhbHvL4josA4soAZ4cKf/XTrBUdv91E+Zv9UZvfBehs5rJMaoJvE8a1HCO0yS2vYU
         9QL4LH0pyIXB+g+tJXFvbfXNLCPJE4169Kv+Nc0c3RMn373sBt2/0GOk6dnigrJjtbPr
         K91IJjPTymH62rzINeAsy8VcD2uS8jsV+l2YoLFVaTtl0GSKsGcMBxquB5lUzM/Qu6oH
         nRELSjd6v/tsQQKVP8mRSbHmCEvbiV+uW60SSE+GVyCFdHKRweXq4tzBMDjiVaV2WrF9
         tuxw==
X-Forwarded-Encrypted: i=1; AL+hErFQqz6XyVED0aJmBDXNFc52AjmulSu5pulll9rB5tBF/R4bAj1vCB+JJRkU8wB++CqFATFr7VYaiKbRlus=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cSRp3CwJAROF2HNvEqKD5uKcyrb8VPR+mtmh8rz4a/7mzUT6K
	i4WLLsnPxIoQ8ltVCHH+96hweIJf+rrpqLiVU+9UOTkBawVASH2NcE1bnMTvLi6IM8Q1qoMtPxi
	7xYvgYJfl8Em4k13+JTm1pRGaIDwv0kco2/q/QXIjQVlWNop3AAv/0rmw3MyXA+lig3M=
X-Gm-Gg: AZFdTZeJPm+HrJ1TqXFQdoebdAxiMDrouheEmhU4dU9HOrQcoUYpRhcJKGOWgIKRuHQ
	IuA7KDjHSwj1uFLWmw6QIZ6il+vd1XXiEbQMNpNTBiPYSK1LPNQ/PkOHA/o/N1l9Wag1Cokm98G
	wIxDMyLMWKLJrX0aCdJsY9a5vtsB5M9xi1/OD2bdgtPaFlO8czLVcqxFpHRP2RDBPCAompEi4yr
	1BOl0pswp69OXknIGyBDKLvqvES5lerz5YP3ozdl5dFBn/QIqWYX/onn6bgGfIZvnVmj702jZLA
	pGvDxoAjEIgftxJFXLzIj1Ybgr2szkbJ8i4+N2u36QiSDM2EbmKLZ4KhDyM9hl8tDg3vQPYd315
	xlVBE5LkGk09a9lB6/Af7wnM5V8VtKleuFQbNWd9Hf82e0bHXgVsIZ9YCQldIhcl25k/gBGTNNJ
	Qkyt8yUSx3qNRqcLwqueZ69RyoGPA0xhxluPFlclMRcJvqYtDNvT6rg0aq4sSuPivfQ8uS/gW+/
	eiI4oshMVmFQuZ4OrcUB4Lr0AMN
X-Received: by 2002:a05:620a:600e:b0:949:569a:a3ed with SMTP id af79cd13be357-949ba7e422amr1784647185a.1.1795429536170;
        Mon, 23 Nov 2026 02:25:36 -0800 (PST)
X-Received: by 2002:a05:620a:600e:b0:949:569a:a3ed with SMTP id af79cd13be357-949ba7e422amr1784645985a.1.1795429535690;
        Mon, 23 Nov 2026 02:25:35 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:34 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v8 0/8] arm64: dts: monaco-arduino-monza: Add support for
 LGA WiFi/BT module
Date: Mon, 23 Nov 2026 11:25:31 +0100
Message-Id: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAJsUBGsC/3XQS27DIBAG4KtErEvEc7C76j2qLjAMDVIcN5C4j
 8h3L06l2pLDBukfab5h5kYypoiZPO9uJOEYcxxOJTRPO+IO9vSONPqSiWACmBaM9sPpx9LPmPC
 IOVMEhyYwLoNsSGn6SBji1x18ffvLCc/X4l6W4iHmy5C+70NHPler/sgpo22AVgnJGWj5MuS8P
 1/t0Q19vy8PmcVRLIphYqOIophOAwoLFryqKHKl8O1fZFEUCC11Y2yAmqLWCmwUNW/UMYEQtGq
 9qSh6pTy4iy4KtOjAKKmVdBUFFqVlaqNAUXzjNFOikxh8RTH/CmdMbxRTFF3OigZAeNc9UKZp+
 gV+QWT2bAIAAA==
X-Change-ID: 20260520-monza-wireless-e6ce7f013f38
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Jesse Casco <jesse.casco@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX0VEHKUvgopAE
 4w1UqYTXKGMJcHkqDz8f8ADuNKwDFxp1lAm3WcAXCPjAN+SSbAIjx64pG4YVonDa1f8ouKcLF/f
 CN6f6cX9Az58GLZDbICpMWIvBz020e8=
X-Proofpoint-GUID: p8RqakPVFA8jzvB_D5ocK_GetjC54Io4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX0qQiw3lFn32C
 F+88bZDUVHzbxh9DkG9BOJmdBC5GOupTGIS489vPnOLZbCVmg+vflKRBzJe4pMvBcgjrEIRK9wY
 YOZ0a8uxxPqZ6qWL7tzmp1QOo4kaH8p+1tvgBsE/4RF1scSHm9jSxOBZFfrStCAozHQNJ9zhBl/
 bdtAgnmqpwWEHWndUdg/WItp6z3kw85H9awzeoCIw6pegGw1PQVfRk/neOPsrWhIRD46wRqepos
 tcYO4A/qJJgppO7DiTHpvszlassZiF8UUGCYKbhAqfzJ8wH6bQqQEtkNmYjX7HSvCzCrp/dcQRd
 jjOb+kE2JOb7mg6xskOr9bisBkIX5N+HgQYt7Umr0A3pEH6JcxzBGFrRS93NEroiU27DFvr4Nmg
 vI2x+3LSeZ1tJkvijaXmg2zcK0AedyaADBHWeyOObFxssHajU6k33RrxE+vMgmOjwMxJRzW1tXc
 OXHm/QCrKbQsyIdjMzw==
X-Proofpoint-ORIG-GUID: p8RqakPVFA8jzvB_D5ocK_GetjC54Io4
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0414a0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=RV2icpplJW3WxIIO30IA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230041

This series describes support for the onboard WiFi/Bluetooth module
present on the Arduino VENTUNO Q (monaco) platform.

The board provides LGA pads for a wireless module. On the VENTUNO Q
these pads are populated with an NFA725B module featuring the
QCA2066 WiFi/BT combo chip. While implemented as an LGA footprint,
the design is functionally compatible with the M.2 Key E.

The NFA725B exposes WiFi over PCIe and Bluetooth over a UART.
Both interfaces are gated through the W_DISABLE1# and W_DISABLE2#
signals, as defined by the M.2 specification and handled here via
the pcie-m2 power sequencer.

This series models the hardware using the existing pwrseq framework
and connector bindings, allowing coordinated PCIe and UART bring-up.

The hci_qca patches depend on pwrseq_is_controllable(), which is currently
only in linux-next through the pwrseq tree and not yet in bluetooth-next.
Hence the next-20261030 base, and hence the BlueZ CI build failure on v7.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v8:
- hci_qca: identify an M.2 attached Bluetooth device by resolving the OF
  graph remote endpoint instead of only checking of_graph_is_present(). A
  UART node that carries an unconnected 'port' anchor (such as uart14 in
  hamoa.dtsi) was taken for an M.2 connector, so the Bluetooth probe
  deferred forever on those boards (reported by Val Packett).
- hci_qca: bind the M.2 pwrseq lifetime to the serdev consumer device in the
  patch that first acquires the descriptor, rather than acquiring it with
  devm_pwrseq_get() on the UART controller and correcting that only in the
  later QCA2066 patch. The intermediate commits leaked a descriptor per
  probe/remove cycle and left a stale pointer if the controller went away
  first.
- hci_qca: use pwrseq_enable() rather than the pre-rename pwrseq_power_on();
  patches 4 and 6 did not build on their own.
- hci_qca: check the pwrseq_enable() return value in qca_power_on() and in
  the always-on path of qca_serdev_probe(), instead of registering the HCI
  device with the controller left unpowered.
- hci_qca: stop dereferencing 'bt_power' unconditionally in patch 4. It is
  still a pointer at that point, and it is NULL for the SoC types handled
  by the default branch of the allocation switch, such as QCA_ROME.
- hci_qca: fix the continuation line alignment reported by checkpatch
  --strict in the struct qca_power flattening patch.
- Shorten the subject of patch 4, it was over the 72 character limit.
- Pick up the Tested-by and Reviewed-by tags from Jesse, Mani and Bartosz.
- Link to v7: https://lore.kernel.org/r/20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com

Changes in v7:
- Rebased on linux-next (pwrseq changes dropped)
- Link to v6: https://lore.kernel.org/r/20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com

Changes in v6:
- Rebase onto v7.3-rc1: drop the now-upstream "power: sequencing: pcie-m2:
  Add QCA2066 (QCNFA765) BT serdev ID" patch and adapt to the
  pwrseq_power_on()/pwrseq_power_off() -> pwrseq_enable()/pwrseq_disable()
  rename that landed in this merge window.
- hci_qca: fully drop struct qca_power and move its fields directly into
  struct qca_serdev, removing the bt_power indirection (Dmitry).
- Pick up Reviewed-by/Acked-by tags from Mani, Bartosz and Dmitry on the
  pwrseq_is_controllable() API, the pcie-m2/qcom-wcn controllability
  reporting, the bt_en_available rework and the M.2 connector support
  patches.
- Drop the pwrseq-m2-bt prerequisite series link, it is now merged upstream
  and included in the v7.3-rc1 base.
- Link to v5: https://lore.kernel.org/r/20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com

Changes in v5:
- hci_qca: comment why the M.2 'uart' pwrseq lifetime is bound to the serdev
  consumer device instead of using devm_pwrseq_get() on the controller (Bartosz).
- hci_qca: note that dropping the always-on pwrseq handle is not a leak since
  the descriptor is still released by devres (Bartosz).
- Link to v4: https://lore.kernel.org/r/20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com

Changes in v4:
- pwrseq: rename pwrseq_power_is_controllable() to pwrseq_is_controllable() (Bartosz).
- pwrseq: move the is_controllable() callback from the unit to the target (Bartosz).
- pwrseq: add might_sleep() and guard pwrseq_is_controllable() against
  concurrent provider removal with rw_lock, matching pwrseq_power_on/off() (Bartosz).
- pwrseq: clarify the pwrseq_is_controllable() doc (Bartosz)
- hci_qca: lifetime follows the Bluetooth device rather than the UART controller (ChenYu).
- dt-bindings: also add the "qcom,pcie-m2-1620-lga-connector" compatible (Mani).
- arm64: dts: monaco-arduino-monza: rename the 'pcie_bridge_ep' endpoint to 'pcie_ep' (Mani).
- pwrseq: reword commmit message (Mani)
- Link to v3: https://lore.kernel.org/r/20260710-monza-wireless-v3-0-46253587af64@oss.qualcomm.com

Changes in v3:
- Embed bt_power in struct qca_serdev instead of allocating it (Dmitry).
- Add generic pwrseq_is_controllable() API + per-target .is_controllable()
  callback; use it in hci_qca instead of peeking at the W_DISABLE2# property.
- Implement .is_controllable() in the pcie-m2 and qcom-wcn providers.
- Treat non-controllable BT power as always-on.
- Integrate the pending Bluetooth pwrseq patches from Mani.
- Link to v2: https://lore.kernel.org/r/20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com

Changes in v2:
- hci_qca: extract M.2 pwrseq into qca_serdev_get_m2_pwrseq() helper, called
  outside the SoC switch; drop duplicated of_graph logic and redundant
  bt_power NULL checks (Dmitry/Mani)
- dts/bindings: use qcom,pcie-m2-1418-lga-connector (fallback
  pcie-m2-e-connector) instead of the generic M.2 E-key compatible (Mani)
- Link to v1: https://lore.kernel.org/r/20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com

---
Loic Poulain (6):
      Bluetooth: hci_qca: Set 'bt_en_available' from pwrseq controllability
      Bluetooth: hci_qca: Embed bt_power in struct qca_serdev
      Bluetooth: hci_qca: Support QCA2066 on M.2 connector via pwrseq
      Bluetooth: hci_qca: Flatten struct qca_power into struct qca_serdev
      dt-bindings: connector: pcie-m2-e: Add vendor LGA connector compatible
      arm64: dts: qcom: monaco-arduino-monza: Add QCA2066 M.2 WiFi/BT support

Manivannan Sadhasivam (2):
      Bluetooth: hci_qca: Add M.2 Bluetooth device support using pwrseq
      Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to 'bt_en_available'

 .../bindings/connector/pcie-m2-e-connector.yaml    |   8 +-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  64 +++++++-
 drivers/bluetooth/hci_qca.c                        | 179 +++++++++++++--------
 3 files changed, 175 insertions(+), 76 deletions(-)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20260520-monza-wireless-e6ce7f013f38

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

