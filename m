Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372913;
	b=0rQmHBdP2GpzcbbYd00rzlM/bhG2Hp3eOQGYn2soJjEjdqftSf9H673wLZKHHIZebtx/
	 +FbP2AIgN6nGikiAiCyZW5wvButNpVvwc6njBMXSWtWyc3MzDwhIB5ZA0fQLpWDrCXtG2
	 GEyj2qx5ANqRUJpHKiXP2Eeltesx2FncLuE/8PtT7Joy4sfvdb4K3efO1Qct3DnqsBm/7
	 N/K7NMhnmPhfkKHrvnvrGHT7Du4/qZB0HpVCs46V+IKBqwJ2Zd+dzLVVLsSJSpNEVav1A
	 MwHP4IbR8oaoSTprdB89xk6D+mwc50F4rCJOFlf0Ch3FmnH7sk+0QVhY7Q3qy0cqoFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372913;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=T9X43wogcCZrborCLOdxz5+TSbJPkp8kWMBPO+V+DSA=;
	b=GHQc/O6nKRm9PeZORgpq7ebZ/R2gjIeM2W6tPT+gyOgf3q8SklXoKWtoWRPenItzu2f2
	 Zd27o41pk7O1dBRfRUhSwpfhXw7iMcoLWVIl9hWf/TEQOCqkBUydrEK/G5DGCEyjGBKTf
	 J+fWOL283ATiYzBx8z8DfRGKjQDPgqSxEwOXyooOIpSOamC21dgu06C9FvT4t3jeXnjG0
	 pBNyTncTbl0l6WmHk5e0uYjxb14maJqR8N8vJKV60mQyLb9ODxWLhzRwIzi0o2RvP+t+5
	 8X/qWsDOQ7sUUM/7fkl6EFBLiVymEm8PPQqcoEVGdo9POXqXK2PMvg5CJQ84gjEX/Gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l+R7qxBK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZykL6xZT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C26B606A320
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C26B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=l+R7qxBK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZykL6xZT
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVON03629009
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T9X43wogcCZrborCLOdxz5
	+TSbJPkp8kWMBPO+V+DSA=; b=l+R7qxBKxp+s9Mm2vOvtypmP69oqt/ZRqlxDHX
	zQiv785wbkEpNE96pZwcPNuZPpESk+Y+GhfNCNG7z/XltLEPPUthZ1EuWQ1qBBoL
	SqVeU8quPZ1gFDb9f6USww8g8znyBpJ9nEOOlTS1xLF8I9lMpuxi8eC/3HfaNzk0
	mUBIYNHIE97cePcGc2mp+fP5XxpTudyXyD6HCMzDgjCT68POEI2B5koVHuvwgLBm
	6tHK/fHJENXR2rTdo2ludCXqx5XkSmMDRLlWn6WJzcZYu97goycgEyo/PDZYW4j3
	3YngBPmA7NVaYnIskuK0WakGDjG4ON9DDeM2mEzdoRUsmZEw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32mgc3dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 18:41:51 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3846d5f54c1so3364391eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 10:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372911; x=1795977711; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T9X43wogcCZrborCLOdxz5+TSbJPkp8kWMBPO+V+DSA=;
        b=ZykL6xZTnhYQKYqCuQgxXwIdtroA69AYp36q1ap3XzTcg5MEndSYwfSjsToLBiyovf
         civnmjacLA8/rPct0DhFxYJHMu7UVhRx9t6yNbKUEjWlXEMV9YtFV78ChfTHVnFYdYWq
         ca4OHJHB2T3kBgoZJXYXodmEiOOgufW6hQ9hg/2BVfJkMg+uegE9UPlMCtd9gKnh274s
         UWUF+MXHy8osVDjRXv1tUO3Jev0OvhmRtDppl1h03TyEj940AijIOHfrK+sJH5fhuVlc
         2gi5e/zB3YTTrdQmM0QZ62UOrLS95Lv9PAy39r2vcfzYHjPijmHX54ZGmEYktMRKU7GI
         u7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372911; x=1795977711;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T9X43wogcCZrborCLOdxz5+TSbJPkp8kWMBPO+V+DSA=;
        b=21WB+dcLJZED7sdgPzMdtbg+xo5agUxURcnZ4TlMsm0PqqjJ7aciokvyTyD+SrtbZP
         mKgnskaliLIKZAlKePlvAm6lPzagu4p9H1rYEev0Ungi9+1vvhTJPL5ogvlgpnFWGVeQ
         fypLJmFwkQ88B/4S1wP0/KMAaoqtobXpqS7UDuzlwV2vRlV7CBd3Z600Pa1YnFQG5BXE
         K1mcit6T4ws7rmevu7Pxzs41vvtSbV5fjix0OGtgXzpP5XARVoh3PCvUS1Lt0svltgci
         d655Vn3oBOLzcIRS35jY+bNQhw5ea85q7x08AIV9wfXYyw5Ba06+bxkJ9yV5RVZRaplf
         NCew==
X-Forwarded-Encrypted: i=1; AL+hErH3Judme5M3nljsHjlShd3JDg8uJLIKJ5SRxwoS2qRkpaEIpgkYs/MG/duSToPCxrLUHtSVmHypZZlxyDI=@vger.kernel.org
X-Gm-Message-State: APuU4Z938S0GayqZin7DSZzpteECBbLDR8GqYgaD8arcIB8D/kbW9o9A
	41WUAhaqFyqXkpmO/xVFnwNBMVwrMaX61g5+bOMaV6zTnJQ4OLi+sQ337cbnj65c9TD/7J2ULPo
	gBYtVZIp7Cte8O9o+MeVNu00DP9OvjRxTA9W1CAS2nx9yU/Dh/frn30RJVEP8czSCJH8=
X-Gm-Gg: AZFdTZfXiP7Cfy66+jN5CkV9s+f/WGqwWPDUSy93Mqh/5TVOMWhLkokjMyuoLR0nd7z
	tBuFcuL+xqf8qghKWsPaxALJt5QZL9k1MYIhdAebVLc59M+NSvV1UjuQsDEXfiD5gm+kKHrTXkv
	b2irtdXUtiy5r58nxOgn2RLWE09fikHq+PnxOhZNK661+LL2X0lLsPuWaz/6DQHjaJi0JD5pF7L
	hqLS1Y3ib5Jtptt+xPnBQupaEJvw/x/feVfq+gE+4nANa0RML6OOHlPIHoSKm4pIUbrcUyR5B5H
	EjvASJvwrUWDo7j8RLtPRmWxXQI5no2VkAaTBcP4FfRIPq2dI7rbkm5ZJm8q6aFp4Iti5xJ65Mq
	AmFAQ4te/rlWxVNf/cjo+COysIK/Fs+yYv3hxnk3bxi56cOOPnKG4drLl04BBZ/H8pygm3bL8wh
	jKYAvZFiXsxQ==
X-Received: by 2002:a05:693c:860a:20b0:384:fe97:8cd9 with SMTP id 5a478bee46e88-3857102771amr11390363eec.34.1795372910606;
        Sun, 22 Nov 2026 10:41:50 -0800 (PST)
X-Received: by 2002:a05:693c:860a:20b0:384:fe97:8cd9 with SMTP id 5a478bee46e88-3857102771amr11390335eec.34.1795372909988;
        Sun, 22 Nov 2026 10:41:49 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:41:49 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: [PATCH v7 0/9] ASoC: qcom: Add shikra and Hawi LPASS macro support
Date: Mon, 23 Nov 2026 00:11:30 +0530
Message-Id: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAFo3A2sC/62OQQ6CMBBFr0K6tqQttQRX3sMYUtoiVaHYgUZDu
 LsFFm50ZzKZ5Cd/3psJgfHWADokE/ImWLCuiyHfJUg1srsYbHXMiBEmKCUCS61LaOzNyxLGvnd
 +wJpXUmZFzTlnKB723tT2uUJP5y3DWF2NGhbS0mgsDM6/VmugS28TEMq/CMqwx3EIrquiJkLkR
 tDs6ADSxyjvyrVtGhdaVEF8YD++DSKSmNIyI4xluVI/SPlfSPM8vwHDtPDDZAEAAA==
X-Change-ID: 20261106-add_shikra_support-d4baa39f4442
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=7177;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=QI57tLKn7EFzkzl+SiGOVy8q6mgkV5HvJqezoU8D5T8=;
 b=WcRLw2lgJPE+ZVUistBWCnJuqO7rCTh69mF8IrO7GNGBCEx7/ZoGgnq1NIyuMYkbB8CBk7ZhO
 G4yi1cy/NClD/qn0JhvgmQeA43R5O2gvOZJYs3/C+UQ5geNySq8IrOP
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfXyrqOp+iF4x0X
 QYc3H3bkeGchJp/6k6Mjz+DpA3d/TmKXMc42saoFy5xDkYCBBBTZ9btv1rNvuH6BSrKjm8k2G0p
 CUHagyqTem/HkurW3YpEpy6ciUZuBHCULduT12dcqMrS03UwD5QpxVhsM6faeDb1FA4F5oaIMKy
 Z9SbObbCs1Cm74zwZGR1jD4y2pOynOFEAdOeRKHEHkUPvbVaE1sTfmQMl5uTa4z4Ua6xrUYO1qn
 mXv4FGMj2FPSRKvJ4Kjpwg4EETLTq/2Teg2kdbKBNccP4I2wUlYIUAUx9wRRzlEtWotnzKxGjH/
 7e1Q9vNRhZxnIkyL/0r0ZNeWTVkq7lqqeC2IJ5j2Vai5E80LTakewHsKCuA5XirWHtqygY+ThXK
 fsO+3pXlcvxuRXzCdZxLjQ8If7tw8hA9/eYSnjm/4S1Id/3KNCYHj3mD+E1+KmUCZcICpG50v/N
 T6lbRo+nuEKJjUhMcqQ==
X-Authority-Analysis: v=2.4 cv=OM+yTiaB c=1 sm=1 tr=0 ts=6b03376f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=iox4zFpeAAAA:8 a=vVXzO8Y9Qna1OQ1r6xcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=FO4_E8m0qiDe52t0p3_H:22 a=WzC6qhA0u3u7Ye7llzcV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX7X+n6V6pmNFB
 vzEnVICAG/ZW1Vvri7kaMikyaJ/cA0+sx/1AU1xiRxh4Nut3Pck48GzgTuhP+RzNivTXruhkfbQ
 lmY/izN6EB/7OBpTzjly/96xtb5hLI8=
X-Proofpoint-GUID: VCBPNmhJ1eVLy60xqdF_DA6AMggCQ1UJ
X-Proofpoint-ORIG-GUID: VCBPNmhJ1eVLy60xqdF_DA6AMggCQ1UJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611220074

This series adds audio support for two Qualcomm SoC platforms — Shikra
and Hawi — by extending the LPASS codec macro drivers for version 4.0,
and by adding SoundWire microphone capture support to the VA macro.

Shikra (LPASS codec v4.0)
--------------------------
The first part of the series targets the Shikra platform, which
integrates LPASS codec version 4.0. This is not backwards-compatible
with previously described compatibles, so new DT bindings and
standalone compatibles are introduced for the RX and VA macros.

Driver changes include version detection enhancements (including a fix
for the missing v2.9 version string in the common helper), FS counter
bypass programming required before the codec is enabled, and a v4.0
specific regmap configuration covering the additional adaptive filter
(ADPT) blocks at 0x0800..0x09a4.

SoundWire microphone support (VA macro)
----------------------------------------
The VA decimators previously only supported DMIC inputs. A new patch
extends them to accept SoundWire microphone (SMIC) sources as well,
updating the ADC_DMIC_SEL mux programming to be resolved at decimator
enable time rather than at mixer write time, ensuring correct operation
regardless of the order in which userspace restores controls. DMIC-
specific HPF programming is skipped when an SMIC source is active.

Hawi (LPASS codec v4.0)
------------------------
The final three patches, add support for the Hawi (and Maili) platform
which is based on the Bolero LPASS codec v4.0.

While v4.0 shares the same RX and VA macro register layout as the
existing v2.5+ path and reuses those helpers, the TX macro is based on
Bolero v4.0 — an extension of the v9.x TX macro that adds a port-select
stage in the SWR microphone input path and an adaptive filter (ADPT)
block. The ADPT block must be disabled before a decimator is enabled;
this is gated on a new has_adpt flag in match data since the register
does not exist on earlier versions.

New DT bindings document the RX, TX and VA macro compatibles for Hawi,
noting the clock differences: the RX macro uses the 'lpr' clock rather
than 'macro', and the VA macro takes an additional 'heartbeatpulse'
clock sourced from the LPASS VA CSR rate generator.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
Changes in v7:
- Fixed the register mask to use the correct value, as reported by Mark.
- Dropped v4.1, as Hawi and Shikra both use v4.0 with the required
  board-specific configurations.
- Handle FS control and ADPT control through board-specific data while
  sharing the same v4.0 version.
- Link to v6: https://patch.msgid.link/20261106-add_shikra_support-v6-0-2cda302237cc@oss.qualcomm.com

Changes in v6:
- Clarify the LPR vote naming and document why Hawi uses a standalone
  compatible instead of the SM8550 fallback.
- Reorder the Maili/Hawi fallback before the SM8550 fallback.
- Link to v5: https://lore.kernel.org/all/20261014-add_shikra_support_v5-v5-0-fb9f0667e613@oss.qualcomm.com/

Changes in v5:
- dt-bindings: rx-macro: drop the redundant clocks "minItems" from the
  shikra conditional, it is already set at the top level suggested by
  Krzysztof.
- va-macro: shikra: do not hardcode the codec version in match data, read it
  back from the hardware and cross check it against the registerlayout
  selected by the compatible, reported by Ajay, Sashiko.
- va-macro: SoundWire mic: do not let a write to the DMIC/SMIC mux that is not
  part of the active path reprogram the shared ADC_DMIC_SEL bit of a running
  capture, reported by Sashiko.
- va-macro: SoundWire mic: clarify that only the HPF zero gate assertion is
  specific to the DMIC path, in both the commit message and the code as
  suggested by Ajay.
- Add device tree bindings for Maili.
- Prevent duplicate registration of TX DECn MUX controls as suggested by
  Mark.
- Add v4.0-specific regmap_config and default register table.
- Link to v4: https://lore.kernel.org/all/20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com/ 

Changes in v4:
- Added three new patches for Hawi / LPASS codec v4.0 support (DT bindings,
  TX macro Bolero v4.0, RX/VA macro v4.0)
- Fixed all issues reported by Sashiko in v3.
- Link to v3: https://lore.kernel.org/all/20260917-add_shikra_support-v3-0-fc0e79c341aa@oss.qualcomm.com/

Changes in v3:
- Added Shikra-specific clock constraints for RX and VA Macro DT bindings.
- Restricted clock and clock-names properties to align with Shikra hardware requirements.
- Removed dead code from patch 3 of v2, as suggested by Krzysztof.
- Replaced open-coded checks with a flag-based conditional for LPASS
  codec v4.1 specific configurations.
- Reused existing SoundWire microphone widgets, as suggested by Srinivas.
- Switched the regmap cache type to REGCACHE_MAPLE.
- Link to v2: https://patch.msgid.link/20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com

Changes in v2:
- Updated FS CONTROL and ADPT only for version 4.1, as suggested by Krzysztof.
- Addressed Konrad's review comments from v1 by replacing magic numbers and
  lower hex reg values where appropriate.
- Link to v1: https://patch.msgid.link/20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com

To: Srinivas Kandagatla <srini@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

---
Mohammad Rafi Shaik (5):
      ASoC: dt-bindings: qcom: Add Shikra RX and VA macro codecs
      ASoC: qcom: lpass-macro-common: Add missing v2.9 version string
      ASoC: qcom: lpass-rx-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add shikra compatible
      ASoC: qcom: lpass-va-macro: Add SoundWire microphone support

Prasad Kumpatla (4):
      ASoC: dt-bindings: qcom: Add Hawi LPASS macro codecs
      ASoC: dt-bindings: qcom: Add Maili LPASS macro codecs
      ASoC: qcom: lpass-tx-macro: Add support for Hawi
      ASoC: qcom: lpass: Add support for Hawi

 .../bindings/sound/qcom,lpass-rx-macro.yaml        |  39 ++
 .../bindings/sound/qcom,lpass-tx-macro.yaml        |  23 +
 .../bindings/sound/qcom,lpass-va-macro.yaml        |  40 ++
 sound/soc/codecs/lpass-macro-common.h              |   8 +
 sound/soc/codecs/lpass-rx-macro.c                  |  17 +
 sound/soc/codecs/lpass-tx-macro.c                  | 576 ++++++++++++++++++++-
 sound/soc/codecs/lpass-va-macro.c                  | 431 ++++++++++++++-
 7 files changed, 1109 insertions(+), 25 deletions(-)
---
base-commit: 7884221ca9857a317bf4bd81ac3bf5528f266feb
change-id: 20261106-add_shikra_support-d4baa39f4442

Best regards,
--  
Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

