Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795917;
	b=S4xoHuAwvDZP+8VUIqyyXgcJsGhvtGydYLFqsgT0V/uAT3eD1iPDg1kJL99aSBfHYe59
	 Y+ez80n8Dh1faRLJqZczVg/fAVj+VMZJlXGzWr16+vMQTsQ2Di6XyYmfp8yMIZIw42xtx
	 yiKOYAvPikKn5JpNUxKymvUChaJEswM+prmbi/0dkF6PdSmjYx6YC61FcToVMGaK1JRxG
	 IbZrGvwHW/G+jSEHm5HPpfz72rowusmOOyv5uv5kGQD78wDndGfW+Ba7o/o0Uen9ykhOQ
	 sxhIdktfa1z8y5Z7nyaX6JEB54lx8WuRINbxPd4Txd0AVYbTNqLMHMosaHrErHm0+dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8LLAAfDIbUIbvMJ7ojV13q8DDkcIUEMGc9YXYUHXuaU=;
	b=jn8fmSS4PbMlJaJ67+7wYlHUd1Zm94uVYggcQxPU+jd7x8nlHPwlmXegZ/wb0Yrh2+Op
	 ZL2w2JTV6zIWB5RzCe4ZkQqUqrRYnbhnkgLQckitxYzZa2/y8/G1ILRKLWpuuZNhr6EOb
	 kXf8NtVZPrHNsZlCTDSoumkv6WDE7zVBSowzpPzXxyFOD8kV+299iXowd6aJO2r1Tp24P
	 4ODdVKSsvPDUFosttBIo9PWLYtmBqwTyLU+bA9pBlup2KNpf+7hZ+EGyi76umFXhCp9oV
	 NK/WW4ycvxus+ysibH+Pka1cRrlBKHU7zuWFGNXLoUOKz1wgE5fK89gtePtyi4Tkw5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eI3R2UEM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cH1h096l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99819606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99819606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eI3R2UEM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cH1h096l
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpUkf2211145
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8LLAAfDIbUIbvMJ7ojV13q
	8DDkcIUEMGc9YXYUHXuaU=; b=eI3R2UEMlNhzs6B/vVajYLhAUc8I49tJDFqe1i
	69N5cangVE7hDo9uRvazzL2HLTBn/jrxmiVTpugZ1aLHigwr1B8iPqVY+tmI+KyT
	x6x24w9o4HInlPfjqth6gc/uKJsOmo7+poisLOoPibCd51EghIIjWEbIKwoqfkWo
	84/QbP1XptoTuC+bBZYrMlgx9oObSqQlVwNAhKBPw70jK94s84s/xjzcgRDRgJ4r
	8l6lCvEnoLc8zqmJk3dWkiTAUuZ0MzMtCt8C9/zSPgaRQEbXXmrUvkcLuOusKg7z
	F0KLNAfCXBDz63qVWTC/hp00eJvQaS58ZCKvRPFAJEHfhDjQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55uqy8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:11:55 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67dabc6d5dfso3177461d50.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 08:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795795915; x=1796400715; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8LLAAfDIbUIbvMJ7ojV13q8DDkcIUEMGc9YXYUHXuaU=;
        b=cH1h096leOST54XfCcw4c94P1qpzpyg6RGXX9x5FI9Pp1rpsLMVuVTpQZh2UGebDux
         r8WUKuHsnY8/1cAa0+RsQ/kSCKzaaeqQUbTq93Q/z5Iy4zWaXFWOXMSyOHVQoB5OGnAm
         +kY8PmIV4ZxupfjL0FdrPrx01Aa0ECcp1W7ycwWmiKJhjO/uOnUNWJ766dnuXX9nIC1t
         SfGwS22uwZsGIj24bC/za7XXdqxpLdHiNDCZzKhR1CTUigjcmvp7+M4dwxcoVQ4jHyIh
         Nb0B9oBCbb30dBU18OIkhaJecsmT3BuZ7ip459u7S3uMBcFggEJw2ynHQmjFYqP0aMzd
         ye6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795795915; x=1796400715;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8LLAAfDIbUIbvMJ7ojV13q8DDkcIUEMGc9YXYUHXuaU=;
        b=ZQ2t0ikWTY2bMxHFeIUkOqDG5e3IE91fyi7H7Fk/Gnnj7zkhYW+MJn0qKPUjL/d4YP
         1++FB36wkKi/fbHSXCV/6hhoAruyAS3z8ETlbWG6t0xyEp+SjfdB6jsHnKDzpQB7mOjl
         UqLDGPD18TZ79ggFHdsVJotG17hd3RdrJPEATC+ZL1Jp4SSlTdrrboRTAZyCJi31gaO1
         mPekCKA/C2ZH6XdFdr9MFWE+1SJeRmR2SwYHvciGcbqF4nKbXlrqKUqgV4335PuGqjg3
         YRbeCNrPeQbSBWnET04KtDsQKPm2gKnh5nCEdAKKHohTqr6wzJ3DNZTcaSucA9EWGAzk
         iWSw==
X-Forwarded-Encrypted: i=1; AL+hErGKbRa8QmPWyHrbS74UbJAXHlmvH9An6+AqU4lLQpNeHb53Zdg80fwE3SbWgibd4n9TssV8q4m8Z9cJMj0=@vger.kernel.org
X-Gm-Message-State: APuU4Z85niEJarvVQAnGahUQV9dzDaTLQnvY7804sXaUqvarIKY/4qy+
	xgRK7mGCq1lZ/T/xF9unZ7IoEYKthMa8gFCTCIZe+cqKNkkYY28/xPCOivknJ3yDI8CKYUJTxtg
	CDjsFjw2tOBGe5IzwXJK2PGkYO06pCm8HMcJOOtvfKHF0yoS0zO/TFaFdoIRodQvCE12L3EOTJS
	93ew==
X-Gm-Gg: AZFdTZcJP+Vy4496WKFvPshXS4HQtpD4buz9fylqi26IhrRPsQpUBpMTELciflb7PI8
	E2DT9AIgXvqfEvYt8UfUspAOVsLlJJVp3j7FcXy3yL1llGFePDKZHabPSHUfMuF/xbHbCcaDsud
	DY4PmNX35qPQUEA+nQbHMittX5sUo9K36Dl+9Eb5AFz142hKdw+2XRuNlWAqz3qR+zwoJxvVCKm
	MUjmg8UzhuQvPYZ0HyjddLsB86yGcnYwODGyAJqmH7kDaxads0C3+P1wcM32fNvWEEtorZ9q4Aj
	JUBwYWR96Jwpm7NPqLby8s5Ba5barhz8xaOVjJGoP9eBco897Ou86kYNY8MCfDzF2fmOcXNqy5o
	s5fRBA9ZAcbXDKT+WSj/gfXyqCam4yQYxF9L1pHwf7N50iAyW4PtHSkGzZcxl3SDVx2AZXzATDW
	BwNYeVvcDoY3xAsK7dB2cnDUjQqF4wM0o9iMG8HkaTHCQQoWbtx7tOS93NStxfE0dgvRpQ0MJn5
	GZj7q7OWJ/oVfmpMNLE9mjvRyKN
X-Received: by 2002:a05:690e:1919:b0:67c:1b89:b117 with SMTP id 956f58d0204a3-67df444fa54mr12364913d50.77.1795795914767;
        Fri, 27 Nov 2026 08:11:54 -0800 (PST)
X-Received: by 2002:a05:690e:1919:b0:67c:1b89:b117 with SMTP id 956f58d0204a3-67df444fa54mr12364842d50.77.1795795913995;
        Fri, 27 Nov 2026 08:11:53 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6046:9c83:ea4b:ae9c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm271728165e9.3.2026.11.27.08.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 08:11:52 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v3 0/8] media: qcom: camss: Report the hardware SOF
 timestamp
Date: Fri, 27 Nov 2026 17:11:50 +0100
Message-Id: <20261127-camss-hw-ts-v3-0-e4b6ad98ce9c@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAMarCWsC/23M0Q6CIBTG8VdxXIeTo8DoqvdoXSBQsqUYx6jmf
 PfQq9q8Odv/bN9vJuiid0iOxUyiSx59GHLUh4KYTg83R73NTaACwRjU1OgekXYvOiF1FSipbSu
 UVSQvxuiu/r1p50vuzuMU4mfDE1u/+05itKKyFWCtFlZqdQqI5eOp7yb0fZkPWbkEvwT/JyAT0
 BjFuWtqK/kOsSzLF64naLHwAAAA
X-Change-ID: 20261123-camss-hw-ts-e0297adb69d9
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX4K/j9Qo/hQi/
 j7LCuFS3ReCOQvlBY8sNqQLRLtJdOnvcGF16hbo3xMvIB+sOY5l1AcIg98xIq+GETRupnJvycHa
 ycT4VlaDWOhjJT/ciGvViXQZghHSnhw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2NCBTYWx0ZWRfX0xrCSXJhcYo5
 di5jp50O17tJcU5+1LPb/LpfiQv0h9VxbDA+Ro9b47n/2zShz9Ts0mGgHqe7sbX83YAWKZNhSEa
 o1UIBI/Wy5xBTaPxo05YZHC1vYZh+FPJXUqFlUjy4c7MRmKmvgfAgblTblqWYBDQkwK40UlYa/P
 UV69oW43kcTR6LlBXpHWvw4r6/+tf05q//io/4KBuGLQR0irlNaplyRCO7suhupKLW3unc2Oswm
 hJs87Maslk5zq6tQ5oJNxXmrwR/DC3NftNjI50+hW5QOKMHtLss+u5iX8qXJPLnEU7IZ2wAM3Nt
 qa30yDy4XFj6LtzHBu9sr+9I4W7qkE3SvBOy3BKEwE3JtbWX0AYgG7TzdZGUKJLW13fvtjYhC8u
 /5B5gKseVbcMBTp3NgtnUp2mY2Q2pDzzEpwW/b4JQjCJTikRAEtZYqAtXjpYkb+DvxeNjX66Wek
 hli9+fN6xkJ2owGTGXQ==
X-Proofpoint-ORIG-GUID: g7el48lAzy5kz3h7gZ60F3zpaOa9BUX-
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09abcb cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=UySOH1T43K12eaTAI2UA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: g7el48lAzy5kz3h7gZ60F3zpaOa9BUX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270064

The CAMSS CSID latches the ARM architected counter on every start of
frame. This series uses that time to stamp the captured buffers.

V4L2 defines vb2_buf.timestamp as the time the first data byte was
captured, but CAMSS stamps buffers from the write master done interrupt,
once the frame has finished being written out to memory, which is about
a frame period late. The hardware value is free of interrupt latency and
is directly comparable with CLOCK_MONOTONIC, so it can be correlated
with other timestamped data such as IMU samples.

Patch 1 adds a CSID operation for reading the counter latched at SOF,
converts it to CLOCK_MONOTONIC once in the CSID core and keeps it for
the frame being captured. Patches 2 to 6 implement that operation on
csid-340, csid-gen2 and csid-gen3. Patch 7 uses it to stamp the buffers
and patch 8 reports the new source to userspace.

Patches 3 and 4 are picked from the timestamp support Bryan shared
earlier, with patch 4 adapted to the operation added in patch 1 rather
than doing its own conversion.

Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor. Over ~1030
consecutive frames at 60 fps, the jitter of the timestamp the CSID
computes, measured as the residual against a least-squares fit of the
frame cadence, against the interrupt time it replaces:

                        hardware SOF    interrupt time
      median                   43 ns            356 ns
      p95                     113 ns           1135 ns
      p99                     139 ns           4901 ns
      max                     181 ns          10680 ns
      rms                      60 ns           1123 ns
      cycle-to-cycle           72 ns           2658 ns

That is 19x tighter in rms and 59x in the worst case, and what is left
is essentially the 52 ns period of the 19.2 MHz counter the value comes
from.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v3:
- Dropped the v4l2-event patch and with it the event timestamp. The
  series now only changes the buffer timestamp, and the SOF time is kept
  for the frame being captured rather than put in the frame sync event.
  Reporting it through V4L2_EVENT_FRAME_SYNC needs the core change and a
  decision on the raw-value field asked for in v2, so it comes
  separately.
- New patches 5 and 6: implement the SOF timestamp on csid-gen3. Titan
  690 moved the timestamp controls from RDI_CFG0 to RDI_CFG1, so patch 5
  picks the register per SoC before patch 6 reports the value.
- Patch 1: fall back to the interrupt time when the CSID has no usable
  clock snapshot, and keep the first SOF of a stream on that fallback -
  the register update arming the latch is only committed at the frame
  boundary that same SOF signals, so no counter value is captured there.
  As a result the stored timestamp is never 0 and needs no fallback of
  its own.
- Add measured jitter numbers to this cover letter.
- Link to v2: https://lore.kernel.org/r/20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com

Changes in v2:
- Patch 2: read the latched counter through a new csid_hw_ops operation
  and do the conversion once in the CSID core, instead of passing the
  time into csid_sof_event() and open coding the register read in every
  CSI decoder (Bryan).
- New patch 7: report the timestamp source as V4L2_BUF_FLAG_TSTAMP_SRC_SOE
  on the SoCs that can track SOF, rather than leaving the queue
  advertising V4L2_BUF_FLAG_TSTAMP_SRC_EOF.
- Link to v1: https://lore.kernel.org/r/20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com

---
Bryan O'Donoghue (2):
      media: camss: Define timestamp registers for csid-gen2
      media: camss: csid-gen2: Report the hardware SOF timestamp

Loic Poulain (6):
      media: qcom: camss: csid: Add an operation to read the SOF timestamp
      media: qcom: camss: csid-340: Report the hardware SOF timestamp
      media: qcom: camss: csid-gen3: Fix the RDI timestamp controls on Titan 690
      media: qcom: camss: csid-gen3: Report the hardware SOF timestamp
      media: qcom: camss: Timestamp buffers at start of frame
      media: qcom: camss: Tell userspace we're using start-of-frame timestamps

 drivers/media/platform/qcom/camss/camss-csid-340.c |  37 ++++++-
 .../media/platform/qcom/camss/camss-csid-gen2.c    |  31 ++++++
 .../media/platform/qcom/camss/camss-csid-gen3.c    |  44 +++++++-
 drivers/media/platform/qcom/camss/camss-csid.c     | 112 ++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     |  19 ++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |   7 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   8 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |   1 +
 drivers/media/platform/qcom/camss/camss-video.c    |   2 +
 drivers/media/platform/qcom/camss/camss.c          |   6 ++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 11 files changed, 253 insertions(+), 15 deletions(-)
---
base-commit: 9bac1a31a7d2c1b9022913e52adffaff63c0784e
change-id: 20261123-camss-hw-ts-e0297adb69d9

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

