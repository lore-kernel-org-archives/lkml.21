Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601970;
	b=RQHfxe5YCItY6EZN+Z0YWMVkdvO8HpRnVh1UHN/HySIi6z13Q1wnT+9iBpm+KkZtGJxz
	 BUfO8tJ3+EJ3lCvY3NkhsTyhEiX4HFaIJSFrzsz6EIIWoNZaI6p7gpIX17L0SwPuL4891
	 5WSqfba5JUgrgOSBNKApm9jPapZO2XwySzWjrPZht5eIcOkb39JvFViIC9aNj4piNlBTZ
	 MsEGlVOywPKWCmuvbtfrX7TlWlOx8Qz1Dpdh8ed1DxZ0iHczjHvX457ZqbbBe91jG8Z6i
	 EEH3amQp0LEHaTmpdpk+qLpqSsFAWbZYyKPLxUHBfRVd/Qv1JTpoEhhT9w8jIhzUE6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601970;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WZGUso68U+c8DwdxktvXeeeB4ezc2TpH+kTAsRQbmiw=;
	b=PiV4izgXFfFBGO3qOQqnSbTgponT9W8Nc9T3ut9zOX+MDX/AS17MVuXf+h48mlK68CSY
	 6rkpgzP+eTTR9jjlC92GxaqRl1rZ0eMCORJscS+JXAbZ9ZBSF7qvJi4uztefld5Ln2sGa
	 zbXS9Z51cmF3lfN0pL+gDx41M+0gpv/iAtEbaPhDlg+nvJ752ILYhh7L0/DEE3NrlKhw/
	 qi3pmB0OLBvpiKf7dFCTddTmDG/USB4ni3LK5a9V/Q/T8NX4KJniK9d57eEMlBXucAvOm
	 40moM4uaAn+cDQ9R5enKqxDFAXpqA5ds0ETapV+tsYF8LmqdkJVdOnV1W18mjs3POkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="JdFiu/l/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbVoxoX3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D75606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66D75606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdFiu/l/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YbVoxoX3
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mlrJ3611460
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WZGUso68U+c8DwdxktvXee
	eB4ezc2TpH+kTAsRQbmiw=; b=JdFiu/l/wCkJ7RgexJTeWZ6HIcQMnNCIlAbFAa
	ihXoBo8QxeG4xbygsKGBFY8CoZoN1mFtNxBYuEJ/6k/U6CvwwmvObwsoTUfdhYL8
	GxTNmLMCZg+g6gLc6mLUtOaJ7FP4gtG8VRAHD46n4tOYktjKO00kPLiAYzZPGVDE
	YX7fWB0eM7wf1mRKnmhZjupPakLJaOVnUFwH6g2/nvfQWld9o+qdzs2G/Lver0pz
	I0Vkd1/02NSkLvIC5j7srFNZ6lNcAXCM6kf0oKGSZOy6zDvJI4DEJxT2DfXEIdfE
	naWLmhSuCndVkJ4X5+lic+sc3XdBI5gpx4gxvmOuHHpTW7wg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsb3st-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-921286add9fso37530336d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601969; x=1796206769; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WZGUso68U+c8DwdxktvXeeeB4ezc2TpH+kTAsRQbmiw=;
        b=YbVoxoX3ZTByEkHEh808rDrviK57//aPuLYLODimonB+pVvH8RvPKKMbOTPOOmeOzy
         R5OQt6Lb6UTJA7u8Jf54Yn4JSC+b6VX585Z1SNDUy6iwtQUvHlDKmsP9EoWI+D4FzSJM
         RKJ1PeI3MaWSCFvZtnMb/nWRNIQBJ0CMwuETHG33DcD6OlEGCACOqKPeCqEnDrsIJWaw
         EXRNr886q01r8cW3eNaJXcJDO5tG5Fd0JEg3kYZKSnuRYcByaX5tFvEay5rFJSn9FUko
         xFGyFfzWy7cR45rtfxiXp/dzyS+/WQXK5E7jA7EzwQdnloCRA0KBh5gSq1VxTkETctQB
         TleQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601969; x=1796206769;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WZGUso68U+c8DwdxktvXeeeB4ezc2TpH+kTAsRQbmiw=;
        b=zpqGjBJkdfiqMZa1nq+CKrYCCR748NAmrbk3S6rudCaD3AQrVVjgGR+ruplALZo7zp
         wZtGPiBXEfWYdB70AxQmMQVEqA0dkbSRfj/14sfXAXMBbYshKR935CE39+vP9s8PSGSO
         ooRbaRD4n589koHK2lhtflVc1L1vZXS11DzhunZhbLmEwVzE/NxKBk/P67t5bAkWSbNY
         LCT/zNrxdjN9RRAuSajLAN1LkawuXEfD3CGRKoemJmR6u+MpOiQzsXaWrzwyhaKgMsz3
         ANDnmrsjpeazS+EPjwDDVrM/XBVLeOAmZNqiYGCJU2/ukM4EJVGDeZVwa7ZrdKYD9b+M
         2zRQ==
X-Forwarded-Encrypted: i=1; AL+hErHTpUM5ZPI2/IBA+hz+SMRljSwNDtu5ZJep83ypyEu4z2Ow+2dkIvhSFPmmzLBa3l45ay6v2LFfGmB080k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hPoztsIsGb4BDyXYqa7uSB8w2bbhPEt+ikiWDFYqFQP7G929M
	GcZXY6+JhPoPq9t8CRArJeSWcM4lfxX1CWQJQiGojr1i/Fy2cBmOGgBTg9r7HHsGOb+awD+bWDn
	UyECk5Z277KfrHbAoeSLc4ac+1BQs3WRlhSjW2D3Utcgh8igqTxbn1X942FlfAfZoBPQ=
X-Gm-Gg: AZFdTZd0556cBaxmbJ5hoi1jvqFauSwct9+YeMPWWD/aaWnfXRb+fCZboZU9ouf+N8J
	VmoVNDjLnGuS9evNUJMNSYJWrKA3nj9Qqb/dazxUstppo7ydP+w4Abku3D9TAr7d8zY+vCWiwB2
	w2mpqKxcHiA0ARFMraFO0batey/3DVQ62Ep1B0OurJWO2vF+TS2MYjMZSFsIpteOhrwT+HnqZnz
	i6rEGbueH403UcJ6XbMw9uVMWMN9E3JYPJ+JhF8O8UmoplwjTmGvHmH6DAUOEHMFINGxPfBieZQ
	96qDQ1MahHgD66MkAWyQtq4g171p1syNhOMXsMal2mciwFuUEiz+vx1cN5aTFjGpYCq+zN6FgDi
	zlmFNKtq3mtbL/5HbilU0yp7YY42r7/ACiSQWztb5NsRUZhHSNQLr9BalLTmQRgvY2EjLZMK9IH
	V3CH8alcJfGXNnAtzi50OndVIRh6N2zNbyXkgzYt9q4Kbe7k6KIcC3WMn4se7E7waQF9OV3SpDe
	v0GpD7wq5biWIPVr8EQkmJT/lkq
X-Received: by 2002:a05:620a:46a5:b0:949:7c8c:54dd with SMTP id af79cd13be357-949bab23d38mr3015219385a.59.1795601968646;
        Wed, 25 Nov 2026 02:19:28 -0800 (PST)
X-Received: by 2002:a05:620a:46a5:b0:949:7c8c:54dd with SMTP id af79cd13be357-949bab23d38mr3015216885a.59.1795601968109;
        Wed, 25 Nov 2026 02:19:28 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:27 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/7] media: qcom: camss: Report the hardware SOF
 timestamp
Date: Wed, 25 Nov 2026 11:19:24 +0100
Message-Id: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIACy2BmsC/22MwQ7CIBAFf6XZs9sAJjR48j9MDxRQSKQo26Km4
 d/Fnr28ZF4yswG5HBzBqdsguxIopLmBOHRgvJ5vDoNtDIIJybk4otGRCP0LF0LHhBq0naSyCpr
 xyO4a3nvtMjb2gZaUP3u88N/7v1M4MhwmKazV0g5anRNR/1z13aQY+zYw1lq/Mnw9ua0AAAA=
X-Change-ID: 20261123-camss-hw-ts-e0297adb69d9
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: rNBQShT6r8q7fXlMvigt_KGDc0uxoOy-
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06b631 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0dbMMC3Z-gWnjGpt8oMA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX/msp3ji1vNZg
 uohXGEuN2YwHCgQE9LNXoDsCGvXLGqPT5N/rboHc88TTCo6zv5jtIAZ4mdcRZsD2Xr8ZNi367wv
 Xjmb16hZN6D3dl+eif8GS0bBILzYPqA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX8TWbeKY+wHKk
 3vG5en8W07eGjegjdprvG5xhnABCbDPN+JB9QFpo7XCuaDB5F6Y2YlbuFItaWVH+XMD4OqptAXd
 kYQQrdhOV49DfhTCaxkHYw5n9bJn+skJ+HrdOhCnfLwAY7/kh7l6AK8CQCyUZowdZE51jzYufNJ
 7vYV+206FCVKIR3xPyacIHsgv4nCsmuYDvo1F00QF4padYpv4VNmjdAG/6DfSAA8JTU8tIDGy1z
 +WLESyNJHfnK+fPf6Iv1ayMCAFhC1jCkyu1sMdEiTJbXXs/f96wO05bsOwUyv11OKBhFdIEiJFa
 rllcAneQM9O14pGwYGLXypbTtrBShPizIDkNymSxHhLsUSTr5SIrhbvpPmgNV/9pDho/dybmGpV
 17lZfe5iZcPPOI/j7dD+vL3o/RkwG/vteDy9SbLDURmt18d2r52fBMaooRKt3C4PE3AVeC61Lwn
 RC2c2HnwIvA2mpQ1UQQ==
X-Proofpoint-ORIG-GUID: rNBQShT6r8q7fXlMvigt_KGDc0uxoOy-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

The CAMSS CSID latches the ARM architected counter on every start of
frame. This series exposes that time to userspace, both through the
V4L2_EVENT_FRAME_SYNC event and as the buffer timestamp.

Until now both were taken when the interrupt was handled, or worse, when
the frame had finished being written out to memory, which is about a
frame period late. The hardware value is free of interrupt latency and
is directly comparable with CLOCK_MONOTONIC, so it can be correlated
with other timestamped data such as IMU samples.

Patch 1 lets a driver fill in the timestamp of a V4L2 event instead of
having the core take it. Patch 2 adds a CSID operation for reading the
counter latched at SOF, converts it to CLOCK_MONOTONIC and puts it in
the event. Patches 3 to 5 implement that operation on csid-340 and
csid-gen2. Patch 6 uses the same time to stamp the captured buffers and
patch 7 reports the new source to userspace.

Patches 4 and 5 are picked from the timestamp support Bryan shared
earlier, with patch 5 adapted to the operation added in patch 2 rather
than doing its own conversion.

Tested on QCM2290 (Arduino UNO Q) with an IMX219 sensor.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
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

Loic Poulain (5):
      media: v4l2-event: Allow drivers to provide the event timestamp
      media: qcom: camss: csid: Add an operation to read the SOF timestamp
      media: qcom: camss: csid-340: Report the hardware SOF timestamp
      media: qcom: camss: Timestamp buffers at start of frame
      media: qcom: camss: Tell userspace we're using start-of-frame timestamps

 drivers/media/platform/qcom/camss/camss-csid-340.c | 37 ++++++++-
 .../media/platform/qcom/camss/camss-csid-gen2.c    | 31 +++++++
 drivers/media/platform/qcom/camss/camss-csid.c     | 94 +++++++++++++++++++++-
 drivers/media/platform/qcom/camss/camss-csid.h     | 19 +++++
 drivers/media/platform/qcom/camss/camss-vfe-17x.c  |  7 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |  8 +-
 drivers/media/platform/qcom/camss/camss-vfe.h      |  1 +
 drivers/media/platform/qcom/camss/camss-video.c    |  2 +
 drivers/media/platform/qcom/camss/camss.c          | 12 +++
 drivers/media/platform/qcom/camss/camss.h          |  1 +
 drivers/media/v4l2-core/v4l2-event.c               | 20 ++++-
 include/media/v4l2-event.h                         |  9 ++-
 12 files changed, 228 insertions(+), 13 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261123-camss-hw-ts-e0297adb69d9

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

