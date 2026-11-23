Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442175;
	b=T2K7NtAAACbrFzlMkoM/39x4QHOa9zR0reLH7ML0FH6RYOPLmRfiTpjL7XggglCB5LWE
	 VFsNkwTF1aVmXKOCAC55rlQ+v5D8MnxnglDBIHqkZkuCpV0AVRJVpnan4AEVrid3lXTvD
	 UoL/HPwy6ZEuccz+eORrbJaUqelFLuWO2pLX3lvC1Axp6/VOMCp9eOY3W1276+9wfjnZ6
	 /T2wDJy65oSB9xTLErLbnE+AyfGzTPhO+YHPPHpumHPyt3mYXramZprGjoO8KUbhrc9Id
	 Z0J9RdOHLTOLNwSK1gWAnebJH9TzpUe5RENu5Cwx2WASHrM2sjWlZ382uoTuualoVbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8Sw+MMhxFCG3aqs1lI+8E2lgYyctKL4n0R8hZbBBbWU=;
	b=qdJfWze/qFcf9ou3f1YFyfzam6umM5Jw2zfhafIHenoAC1CcRFBR/Evh6ESIS2xTcrI6
	 88A058+MEJdFL9DAC0oSBERQ/Pj1Uk6oDxHumbx/RBRz3w4BbeLgJn4jRBZLqYRexQVTS
	 PWwyh4nGWTniO0clx9AKXET+uuCtxvu1+71+Qdb4It9H1Kx6Ho1qYdqU6Da+QfEYrIFJ3
	 goyT7MOsH5mSPg+AP14Fst2rejEtPnhRdWZmfD9RxzkdyqxZZH39ug8WTPpULE+rH3Wgy
	 /9aLE/EAY5t4d7EJusdUVwbjaKQtPusCwsFkhrao7lpm69w1MS06apr44Pq72R9PEXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BQbvXYyn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IEehc3r6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F69606A6A0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96F69606A6A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BQbvXYyn;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IEehc3r6
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL1Cq2086051
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8Sw+MMhxFCG3aqs1lI+8E2
	lgYyctKL4n0R8hZbBBbWU=; b=BQbvXYynsmbXz0PhWldh9vbdflxXNpPGvNrIMX
	2wYzsJIRbys/GELxCXFbrQOvZWe2YkzQyfYxZynwk+X4/Of6STCO/x4Qkm8C4Csl
	ssGiDwEz4vVdKzf0AgTbB6pBlAy4kzQyJS2uX9L/7DIvymD4LOVhwzlhtmUzWJ0g
	h4uKyP1s0jFPZlG3wSJL15drGwo8aKO2jF8EocfJ3Nvu0HuhsbLZAq+LFnb+KC+C
	D/eSgl5hTredWL4ymrWJ6kHl/MNsNkm9M+IF7RaNgX58jY7ZhOF4usWfFnjbbyEp
	TILU4s//bgtz3XOr4ebwUvxT8xap/JYyRwuGZL4zq5B7KY+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy01np0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:56:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cb7f9bb86so665060385a.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442173; x=1796046973; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8Sw+MMhxFCG3aqs1lI+8E2lgYyctKL4n0R8hZbBBbWU=;
        b=IEehc3r6Xp5QwJzjaxdw9e8cZ5vLuRBxErgGiRGhtdPkIyeup4kylUQ5vr6ZQCAju8
         bhMFCnkLJujNxmU+SgJFmy03wJkLlcTSI9afizUZ7IGakZ2Z7Bg6CI4ZFESym/brzFtZ
         Qm9fFQWUHj7AP/hihaGN3A98hl5TyOz55iN6RwNRluMbgYJxbk2M94meE8dy5tV4KeUb
         DdFUglRBd9XgwfLrbEYsqDAo/AYwWnv11GQuVldaq4sigp7FAXRT5PLX4P0Z7YwXqxSd
         Aq9WW0xRzUDKCbt8bQv52m91TMLCXRtIhoCfuwzlNR8beNfmK5QncGM2VfWRAIp/bmO5
         tbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442173; x=1796046973;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Sw+MMhxFCG3aqs1lI+8E2lgYyctKL4n0R8hZbBBbWU=;
        b=C6e4Wsi7VpfL7vJbDTTkcbH7UfSFyoCk1ytFtF7vGfLkpLlARbgf6IB28KG95SwD6n
         tueAlRt64rV3wevmqseITIvp8vLn4SXsIVGBGQ8oaT6+VXR4mneoDJ4s+iQBuWPv9kFy
         /OgxBBu3WpXDHcpq4pHaBc8w5thE41m9wOBXgMGgyMAuHpIRXplG/HEAiQKv4+blo2us
         f40YXAoITwENZp29wITJZ3evrWHVDj3XFh4fuP/GGVPqUHXV/Qaxob2dAptMOl+JtvwR
         A+yq3PEUHmqb0d7/U/oQ82luXnMXyTf614U2zTOjji2ybuH5eQZvtuHV0bW6UMIwHRXd
         9wIg==
X-Forwarded-Encrypted: i=1; AL+hErFYcC8GTe1PcIDuCLbqrgJU7fWOvme/hN9q1OIRTGS2ma5FH3TNKM1dFx/f6szxbK8hfZSQDtYKV2vBAwY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9s9zg1wQP2Pyqeqyl5ute1tgP+Jq/m+n6m0i/5AMfGOjz2etOM
	E6rjMWlo0QP9+OaW+GBR046SyV6QJ+iIH6dx2O8ZJV9ZlBJSqU3ritUhXizAj67WzZhpHkXvkMD
	7gccGw73fgoSIQGwD/KZrZaE/reDBf7/Z2r+054FARRIk+XnUS8BwZA0aO9KbnmFWDG0=
X-Gm-Gg: AZFdTZe3v17d8/M5sx3SOvHeuBV7L4ErtBbRP8KBNOKEIJTd93WNQHw5TiEhHvN1eZa
	tHbNwcrPiZAuhsZsFcEhH11/n4GfGJBl2/myTSYyYhR0P4NnGxNV3y5hHVrlS9b7vuwLLS1KfLI
	YRmmrrhyLM31lfv7dSo+9rfqW1RNt8yikHUPd3iY4PVN7LVLlYfKL4FfpmUhogT60Pkb7KvnMdc
	1AmsXxGz6Wa9FMKZPTNfIs4hBm1R3IoIgJzn/jZswu9GCXfcBaulRZDRB2VeMezQ/o3VXqCh3/R
	LqDGdp5/DRn3C1KCGqy1yGnEcF+ZbEuyS/yRHcAhbi8uErSnrD9TRNJ7fbPIY+0lKjUeWfzQbMZ
	QqarLxVYRwWdXSM8hMfrGL5SW9ryMgtUCK8oXSEuOiQsVz6g8u5hdG4B5OOU+grUVK3PX88gKgu
	CtGT0U8qRlOgPrf7LGTGMe/xJquexa2RgW6U4csY3xYQwBibVuHtmWJQ3I+wqOF1Sg7dJzL35Pa
	LzpdL5Me419pioAKsN3eIVYMQ7M
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr1891455085a.2.1795442172453;
        Mon, 23 Nov 2026 05:56:12 -0800 (PST)
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr1891449985a.2.1795442171926;
        Mon, 23 Nov 2026 05:56:11 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21724625f8f.56.2026.11.23.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:11 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v9 0/8] arm64: dts: monaco-arduino-monza: Add support for
 LGA WiFi/BT module
Date: Mon, 23 Nov 2026 14:56:07 +0100
Message-Id: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPdFBGsC/3XSzW7DIAwH8FepOC+VMWDITnuPaQdCzIrUNmtos
 4+q7z7aSUullAvS3xI/g+WzyDwmzuJ5dRYjTymnYV9C+7QSYeP379ykvmSBgAQGodkN+x/ffKa
 Rt5xzwxTYRpAqKifKpY+RY/q6ga9vf3nkw6m4x7m4Sfk4jN+3ppO8Vqv+JBto2kitRiWBjHoZc
 l4fTn4bht1uXQ5xFSecFQu4ULAotjPE6MlTryuKulPk8i2qKJrQKOOsj1RT9L1CC0Vff9QBMkW
 j295WFHOnPJiLKQq1HMhqZbQKFYVmpQW9UKgovQsGNHaKY19R7L8iAcxCsUUxZaxsibAPXUVxs
 yJRLRRXFO865Qh0V/bqgXK5XH4BxssqWLICAAA=
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX+CVl3LYbfxvI
 p2y1sA4kKKI+T30Aq97wCjspzGFAJ74aTYMaTxlSiX51+ADrzZVLW6OJ7pKYG1g/AP6O8IDsgG/
 sINPzDcOdMVNjoyl+ucOuNFN+ii2BXV/44mg0odM663d/82j7NnJLoexl1PyHaomVEFECBfgevl
 C0eU4SHXnQDn7L/CqzZE+pZwLkqkmkt3sAdmRVXUAJlJYa9+sblS3EelpMipCeMWuB4RwZg6PCN
 AAtvClmvNeKCw4KUKjgoJSY7Y8r9wAC5Jn3hYZdS1Y14HUdD19i+TsKqZCy66Rpr+OKU9CEU3wu
 u4mF4CUTYUTIr+B0tYMWDusvPW9+o0tdxipVYqUF4QvIAa+qutDuioRFc0GEUgEClEKx9UpW7uV
 N3m+6zA03liSS/kumDLA1dv+VyOW8TH4N2QrWA3FqL26nt5TwEDmiCbzMvVDhK6Cz/mlbA0itJD
 zHWWlZZWs6t7MTzBYfA==
X-Proofpoint-ORIG-GUID: j940tDOA4x6wWHh8kERC8TxjFQYchyKq
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0445fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=07Bm_TEVN_B7e2KTFAkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: j940tDOA4x6wWHh8kERC8TxjFQYchyKq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX6ciyxHfpI0R0
 SxBmiBdESMqYU8khRvAr+TIyNf+UkgPP4q9o2PDIx4iBNvlYj8QJ9fIK/B9uBG+5HRV72Y4MAZ+
 eMorqxoFm5rDVnVLnzPqh6S4zBAuY68=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230055

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
Changes in v9:
- hci_qca: skip the per-SoC power control setup in qca_serdev_probe()
  altogether once an M.2 pwrseq has been acquired, instead of only
  breaking out of the WCN/QCA2066 switch arm. The lookup happens before
  the switch, so QCA6390 overwrote the M.2 descriptor with
  devm_pwrseq_get("bluetooth"), and QCA_ROME could acquire both an enable
  GPIO and a pwrseq, in which case qca_power_off() took the pwrseq early
  return and left bt_en asserted (Sashiko).
- hci_qca: power M.2 modules on through qca_regulator_init() instead of
  calling pwrseq_enable() from the default branch of qca_power_on(). That
  call was never reached by QCA2066, which qca_regulator_init() already
  handles, and it bypassed the UART close/reopen the module requires
  (Sashiko).
- Link to v8: https://lore.kernel.org/r/20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com

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
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  |  64 ++++++-
 drivers/bluetooth/hci_qca.c                        | 190 +++++++++++++--------
 3 files changed, 184 insertions(+), 78 deletions(-)
---
base-commit: cf357cfc025e7f72851479ed3fb60d5f16413c1b
change-id: 20260520-monza-wireless-e6ce7f013f38

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

