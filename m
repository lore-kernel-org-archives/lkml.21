Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454069;
	b=5NQYz2ook9/2K2iSf4y6CJEF0K6t5/T9M1ABbr90juGoHEtnBOARtb05cA4QoHho/s9E
	 M2KWURQ2sKmF5cUjUgoJ6lmWEmS6WHcZebn6jcddX/wzPqjs4WsltmUHf1ZRU8gVTtIMN
	 KJ1F4tjdUybyL1MxLWMqwVB/YRl4fTKrJFY19wDXvQgtMiUAlMVdJjuMzClw8j1x4GdEw
	 OGWT0y8AGuliwchL+9eqi15nz6nrS/qqiSlKpa0KP5BOP/5IBIqotPHNr72SvEFcGUnJ6
	 46iGmkexDe8L124JwIcvjTGSkHOQQAEZ/18xkZNsXCqdy3IZ2dqdjspWJxOIB01VIDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454069;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
	b=FIltotf0j5z7wtr7nbOL+JA6wpL7Pe26BYBiLeyunSxdxki/mWkE+42H1sAnz+jcISYQ
	 r/6TXBPeWTT/hb5lYW6z2TyEibsfnu9vjd1gkq8Y1ZTNhfI4Bald4GdXS5QzQC0YXUEHN
	 Zjf4X42UcMMMzEBJLCEWlclLedHCFBS9vHED9PdmqBMxSJDCwlXeiJgF+nR2zPqydT/Ov
	 8YoyKFIglOiKoUmbp7cBTxc27PWJsWagwg0WVIN4oQ3vLPWYgshNCxexlauu17Oty4LxJ
	 6yr86HmtouAx4do+8SibQ/lpoGo5WOPaSajMn4VIEfriBHjCx36oCfWy+jkW8tnJhFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNtD7xRK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RUmta1yW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1E6606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D1E6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kNtD7xRK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RUmta1yW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGw5B2340303
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:14:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2
	l/yhw260=; b=kNtD7xRKKfKPufQqHWGDlvpUdKfMbwYMs+CfxgvwQwrtsoN20jH
	YMniMJZlfbb2QXZ67Ulv7v11cOe/OB26lYk9meK78i08hqTC6ZDQZcejlAOMh8M7
	TWROgOrZmtEfUB7caaEgZ8ChtFRdtUTqiBjEhAMZmYQo/lzY4D8wUp0wRdgdkz7E
	xFg4hJjBTeXTi00A4AJtCpzF7uNyCVueIB76LQ5TLhyrlohpuhhghKifVap7Tkg0
	fxhVp8HWdBp302mvCxTf0CYJY9GSuqjcDavUMARGrBgBHaclFFGAyNo17CVguIn1
	2oe+hMPnz+J27ZlKi3/hYY+ddw43s/XB+9g==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx2ran-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 17:14:28 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-679f81d5d7bso6006757d50.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454067; x=1796058867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
        b=RUmta1yWodRd96hJYYv2QoRLP5No4YuO3ZX+fX4ciNb8DKKQqWt+wal9AryXu0DfJR
         95A6Nr4QQod1cMERl5egpTI15YLGa0DiXrFPRJElZq9vqsqTwIFT4hk0E1oeztEzBDyf
         TY5BhoZYXsnz2vi/uzm8weJxyn/hA1G2+eedTqMI6b8u73kb9AcImFHlLvl0MR7qdjIk
         b0Ter+KwzQsVijx05+KzggJLpRgEJqk+6T6leF3A8dU6wzGZ1pVE+tqzPXgIgBlbRHqt
         8gVy804Mp0IGtILodT34PqfOUvWVPAdB0hEBZtP4E8uh9R1BPZoU2jnEUMI9M2AiS5Kk
         cjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454067; x=1796058867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4NOMokerScDRusCsIlTIiG7nXOABdwpnV2l/yhw260=;
        b=LxEI1rRwvpILGxLTlUslbCevODcKOu8b/tIMKL4oMQBazFiucy6djzgt/mtIA/aCiT
         2vt2v1esI6vlCkvBJziCmCGKsg4PThvpbDg3M3S5JHVJfWwKAtrr0MPUAJHiGeQrKWUv
         ivWyDZiMQJCHKL3GqOrgNsDnM5BB05iPw7sWSsQGLUTfJX297/MSyhMOEc1amOXdQHGQ
         wpy4Q5LGQoOf2t47juJPq99n0uS3GQMaOX5e063ezZzWbe6IybeyOpjl2O4eApXru5oT
         oOAI8WOW8QRUlaRysUJvefoRl0Tpk5qo9NRzWCeFJccd9HuC4hUTLlTuYTWmNDD0UOUb
         35+g==
X-Forwarded-Encrypted: i=1; AL+hErFv4u5Pjf1Be+bl4/60BEN5w6IZCFf8I6eJVjbQTweNJiiqP8iJSEm5Uqgm0D+IGcFYsnVVyI8vdCmpmhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mKXVBqIGSmhXVZjloc2ezNny4fJM7tdtZ+w64YSK+Nyt7u2ly
	R9UEoJxq5wehREfipSLjNgmDLyDRBNY1ruTRS5h1PyXd6QBbGsNqRRpa1KmYoj7ZclE50ig6IG8
	BlrpM9eiaOAVfYuLOlg8zbQRyUC/OSNRpRZI7zm8AmOa10+zRMtoqvhw52oAQ2k7BP9s=
X-Gm-Gg: AZFdTZcKVdkwZjjP96OhNJXTsvF3tW1mvaLMhYsMwvl1jV9+1UeUJI929H51JMVpeZ+
	G0hmpE+ZDblDcTanW03eoj8+ZTAHZEBHWtc4w4B0a8H5y7Jsi+5ac4uSsRFT5t03yyX8vpFPltD
	nO8Gsd1BhlNau3JhTH/tv+z4VrkCQCKZiovoYrXPEgMZ0UnV+1zn9cKteHrVO4q3yjbx1f/MrVs
	lDr0yegBXax3lP6f7XvjxCvmNLNJQ254L+EVhJusvCLRRKKB/dAM+Znj9vTQb4CeCu0Afo0N9na
	7GOksRJ6tX+s6lp5qir97oLo/rAdlOKogGw6AHqnTKHMeqc86N5GoVFl7VaSlcbvl8xzVUOA5vx
	n5Oflr9JtVa2pV7SWQE8851ZwaVJD222WNWCqtfPVGYmxQNHKtGUpMFvDVINmBqKZ
X-Received: by 2002:a05:690e:150a:b0:679:b5ef:a0e9 with SMTP id 956f58d0204a3-67df44b7711mr3150735d50.137.1795454067111;
        Mon, 23 Nov 2026 09:14:27 -0800 (PST)
X-Received: by 2002:a05:690e:150a:b0:679:b5ef:a0e9 with SMTP id 956f58d0204a3-67df44b7711mr3150728d50.137.1795454066646;
        Mon, 23 Nov 2026 09:14:26 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm23885443f8f.48.2026.11.23.09.14.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:14:25 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>, quic_srivasam@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 0/3] soundwire: qcom: add multi-master support
Date: Mon, 23 Nov 2026 17:14:08 +0000
Message-ID: <20261123171411.444381-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b047474 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=owqDj3WxTxIMLBZ9Q5AA:9 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: 5M3F_OFklhiwOa7gTfhAR-jU2meSekc5
X-Proofpoint-GUID: 5M3F_OFklhiwOa7gTfhAR-jU2meSekc5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX4r/GVxU7bnkm
 yrQcGaW51PmjLUxGJZbMnGroSyGHhhNQtvnVxgzm0mX8628AoskaU2KolPk88Zr7K8k5d9HPY0C
 iNWwE8ZuFa4I03fjvkyfOapyPBw3D24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX4y63BI0Kqn2/
 s3UafBIuOGPQ4+QBKWqASXoitq3UoxKd+mCppUmui8/E9f6OxQaGf4vLUvLHsCvCmMKiGyKhxeb
 uzD+l85Tm0Ajr8a4iiN8ehkVtvdutr8Bycnra5BW0RPEfhpLgThQEbIvlQA5t2FQ34xUwx5fV/R
 OBBH8vUA6L1Qq7A/YebiEqpBHYEZgfv/bpQ1At0TVA3wKkL1uVnYib+f9BHpkdVin7D7Rfdmcgb
 8mAH2LZ14aqMsEiZq1YBCdS6ap4klOOQxbULckrOXwInP5CX7SeGsrds4UksfVxuwmAYYl+AiMo
 FA6vCZDgwjWOlUYU12RuUM9lWvR+ioOOAHTlPab96UjnDuSfEW3WImn2EBSisJdWShcKWxOiYte
 ERQbL5zw63/zAEvRcNL9H7goNUR6DRYGPa6e40X7B4TLrwiaMRd5Da/NF8Py4wKMzAjDUrPu/7f
 scTIgB1n9CxnTL4GLvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

This patch series adds support to the multi-master in existing soundwire
controller driver.

On Qualcomm Glymur SoC, both TX and RX soundwire controllers are wired
up in multi master mode connecting to an SDCA compliant Tambora codec.

One of the two controllers (tx,rx) act as primary controller in this
instance its tx which provides clock and control and some data lines and
other controller instance in this case rx act as dependent controller
providing extra data lanes to primary controller. This is called multi
master mode in Qualcomm Soundwire controller.

Multi Master mode allows synchronous transport across two independent
soundwire masters. This includes synchronized clock-stop, clock-resume,
clock scaling and bank switch between both masters, the Primary master
will ensure that.

From the slave's point of view there is still one SoundWire bus with
one clock and one control lane; the extra DATA lanes just come from
a different pad on the SoC.

Currently the bindings are added in a way that its possible to add more
than one dependent, however to keep things simple the driver only
supports single dependent for now. The primary rejects a second claim
with -EBUSY if the dependent is already paired, so any future misconfig
is caught at probe time rather than silently cross-wiring.

Topology (2+2 lane example):

     Primary IP                          Dependent IP
     +-----------------+                 +-----------------+
     |  MM_SYNC  <=====+=================+=====>  MM_SYNC  |
     |                 |                 |                 |
     |  SWR_CLK  ---+  |                 |                 |
     |  CTRL     ---+  |                 |                 |
     |  DATA0    ---+  |                 |  DATA0  ---+    |
     |  DATA1    ---+  |                 |  DATA1  ---+    |
     +--------------|--+                 +------------|----+
                    |                                 |
                    v                                 v
        +-----------+-----------+           +---------+---------+
        |  SWR_CLK, CTRL,       |           |  bus DATA2,       |
        |  bus DATA0, DATA1     |           |      DATA3        |
        +-----------+-----------+           +---------+---------+
                    |                                 |
                    +----------------+----------------+
                                     |
                                     v
                              +--------------+
                              |    Slave     |
                              +--------------+

Patch 1 adds two new DT properties qcom,multi-master-mode and
qcom,multi-master-peer for describing the pair.

Patch 2 wires up the primary and dependent roles in the driver.

Patch 3 programs SWRM_V3_MM_SYNC_CONFIG on both sides so their frame
generators lock to a single SWR_CLK.

Tested on Glymur (SC8480XP) CRD with WCD9378 in compute mode. HPH
playback and mic capture both work.

Two further patches (broadcast fan-out and SSP-period programming) will
follow as a separate series once this core lands.

Changes since v2:
 - Collapse is_primary/is_dependent to enum qcom_swrm_mm_role
   {NONE, PRIMARY, DEPENDENT} [Pierre, Vinod]
 - Reject a second multi-master pairing at probe with -EBUSY
   (primary already paired or dependent already claimed) [Vinod]
 - Gate the dependent hclk through its own runtime PM and keep it
   active via DL_FLAG_RPM_ACTIVE on the device link; fixes the
   stranded-hclk leak and the double clk_disable on teardown
   [Sashiko]
 - Hold device_lock() across the peer drvdata read to close the
   UAF window against a concurrent sysfs unbind [Sashiko]
 - WARN_ON_ONCE() on peer_dpn_offset underflow in
   qcom_swrm_port_target() [Sashiko]
 - Commit log for 2/3 now explains the lane -> port mapping and
   how the dependent is driven via runtime PM [Pierre]
 - Rebased on next-20261120

v2: https://lore.kernel.org/all/20261001093806.634862-1-srinivas.kandagatla@oss.qualcomm.com
v1: https://lore.kernel.org/all/cover.1789114385.git.srinivas.kandagatla@oss.qualcomm.com

Srinivas Kandagatla (3):
  dt-bindings: soundwire: qcom: describe multi-master
  soundwire: qcom: add multi-master support
  soundwire: qcom: program MM_SYNC for multi-master

 .../bindings/soundwire/qcom,soundwire.yaml    | 109 +++++-
 drivers/soundwire/qcom.c                      | 337 +++++++++++++++++-
 2 files changed, 418 insertions(+), 28 deletions(-)


base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
-- 
2.53.0

