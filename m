Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795601972;
	b=NTC6vA9U0YkaYvUdmjnanS4eTrbgBpUqDXC3A2SwS9+Ey25Ny6s/jcty4E6jlsHSStYO
	 DQgMNMoHe5NWkhmRnlyobWv1/Ngjy7yNWteRoEZZNwwpg3ra0pyPselA3opz1j/54OjoN
	 Axvbzht3NNfKNiDWxQ6zA6Snk405QCO0IynKJUWQCEUs4JmcqQyd7C4KMfm5TXKHQoUth
	 ovdOtew0h1DWLyteFXDlBXhiGunmSr59GUowTPiga5XftMyyr4nEAgWeQawWB90aTec8D
	 DRI59kkJa6KEwTklNWoozRyqWqcM7Ch/ky1Xd+4oief8RUQYWJeSOR82bLbusTWuxWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795601972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=;
	b=Fxt/ZqkG5y2QWlF2kXSUsIHvreQOy1I8OWxazkQEQeC04f4MmO3jwQ4QYz5Q2svcS3b1
	 BCZ7pT4QXRYy0W3UGVvEI7sffY83DAAMu5inoJE1OvVMyry/xboJ6FTCGOPmSbVNgcHwZ
	 SCGXWfCck7g4uv7NLM92EHkjQYloxW6ty1atddQ+o29dYGBCD3uOrZmFsq8vIygkEE6Gu
	 v6yYt1gEyQVa9kMCCkBAE8iYkaj61gd7r1HT7SAzrceWD/c9bkYdczwByZD90wj7uNvnx
	 Gb22uR3QyMyyI5er+2LhBrx1vGk85OwOsmCk2iN3+eK8oL+FlNTqS2UH1AlcZHvXM8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CVYimvvu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZzFQLovX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAA4606A682
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBAA4606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CVYimvvu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZzFQLovX
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTrU2121308
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=; b=CVYimvvuTSHfnyAZ
	nvVbPbnczCElDYKdVxwRbOTxFj2aX5zAKDFaukBKugvRkK8/ToQTWeH3h2+aPIDV
	UXxbTe1FtDSdSkUbV0PFwfct8N0dDc0wH/rbSMcyfTydFnfqc+xdf0Cgu5k5CvTG
	X4bOwcivG5M564LuAt87esNVsO0bpLKzDdMghfCRwKOwMKLE6rtUNv65aEeDaRfn
	GO4f899kGDn6vC4GrpMCgVrxyW3II/krI3DXX6Rnnzcqxm/KW2Lf701VioRIsoRF
	TQbwfiqslk7hMQhvq9CCm0drY2cOHmb9C6A2adxld5LccW8OR0ZnKo1rlfvGRUTD
	J6mYog==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukraut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:19:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2373e9b4so625971985a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:19:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795601970; x=1796206770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=;
        b=ZzFQLovX7vXSW90L7aLBUu9Pqkpid6r45/ailgTH+cegxxeMlFhrXPj5R3pgNFrLXC
         tx+cr3AkvcIQH7IFIuzI7jS5pMA/0IL2FQNqFtyVIDc9vtwmmN8qCI6dCJ6k+Q8JOcay
         gI9dkqwTmmOf6DLWqeve5Chs4tuTc+Kex0kyDrtv+Kbt7Higa+5mmJDEozcliM4vbKg6
         zoNM//yk9fWDkMFSLkkBG/Pye24nyJ5Tuw18jEHAZLmmtQ56CtXWADZTi/ITiAHjkpvR
         oFh2jhodxBZ+GRvljdUfqZb+qDr8Pw6qbx/Tb6xmw0rkKq85vyOzDJMD/ALQ9kRgcC1G
         5TrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795601970; x=1796206770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SNZvtJNY5hmCP2AAPUE4VWCdDtVGFEP2Oi0E6kH+Ms=;
        b=FwnQCcw2Kb7hjI+zS3uw3b0La+1rpVqv9tWSZ3/lG59S2rT6sDOzlmtLNvEljWf2ht
         i4exeHFuI3D2p9M6nyusZ8OKyzrnoz/AgX2BiyebQjZdmnsij54nQahIlmak77CE9zrz
         E0ogjbehh42zpN0yNk7jPVkAPbTmHpBjq1OqEeE2E1Y9mqx5hJ6iIOmMDVVvDep6BMDd
         bni1MOBGXWebyM2lqNo7LBbp4tG7ufKLlPy4z6q9cRhkFLQDjYxzcwLIgRvXD7gWa6m6
         WMT+ZmpU+QK+VhJS6yRjfn5HlcMJV5hUzeCUprrupzG8Xh1WZEmgHuO5a4PC2/nXQ5d0
         XzMg==
X-Forwarded-Encrypted: i=1; AL+hErFbRYYi9spQKXPj3dNN+AQKbaeT0cuOuCq98uqVhdvCftw72tX1wlXWQGTRmrtwN5PkwEHWxtx9fn2jBl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AEhwT5y2RdgWKYLXZKBR4j6Oh2axMDf0vgTD3V2ZXQTZCxwvD
	IE74Vf1mwgBcGgHzeDE1Qm9AiGs3zOnAwAUwKSUNPmxzkE7cta8jhTy9PBvPt/FJ18JOIKrLdkj
	2t1w2Hubrn7jguF+WVYJIaHwoeYMncp3jFry97X41d9noinZ/fjFWkqdfcuqjaRTezZcZUptSsW
	WBBg==
X-Gm-Gg: AZFdTZe13VfkvyQ418EwD31DEywmelFB1aBljJy93/BDkHrZVbLBaXxLfXijaLX9kW8
	j8FMrZG4sL1R2GPifLVuZDgRxhu3/Wib9mIMX3avBetGJgGbjQyg60lttvfuP9z4/Xp1L+mPsi6
	M21cL1rsd1DT5VapW6jw6L98jRbCAv+ntxqfHoyXa6ka0qZZzi2moVqWGKj5k0w5IPMuxH/KNN/
	nlgi816TWaXQ099zjb0Ky3wtvNkJlx3ZnxpGBCqkm1OI7QHsWXk5srian9VkKdA6Pz76NsNsu1s
	CY3thKCpqGChCtvKtv5VtpebfF5t2UwSXgLwJINF3oWhaX6a56coDDYb1yhA45kb2jMU1pVDxqQ
	RrSU5sexcHiSQye8qBWlTmoYcurcakvZ019wBFgp6QsUmThUtJeyBT/pp4NWBfQZRmN34Ju+xZx
	rjopNtY0wwzoovsQKwrdjtYiyE1TywrWA3Enmq8Aysa3S32xr9GRhhZTzIn9+RuOIxKYGtt4ZIK
	Cp/eKTpaXvWVzB96P20bYc+8WVg
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id af79cd13be357-949ba9b8ee1mr3047815085a.17.1795601970038;
        Wed, 25 Nov 2026 02:19:30 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:949:3365:7402 with SMTP id af79cd13be357-949ba9b8ee1mr3047810585a.17.1795601969406;
        Wed, 25 Nov 2026 02:19:29 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4b70c05b9desm9342072f8f.54.2026.11.25.02.19.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:19:28 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:19:25 +0100
Subject: [PATCH v2 1/7] media: v4l2-event: Allow drivers to provide the
 event timestamp
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
Message-Id: <20261125-camss-hw-ts-v2-1-24c955e43d75@oss.qualcomm.com>
References: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
In-Reply-To: <20261125-camss-hw-ts-v2-0-24c955e43d75@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06b632 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=TtxWlH5-b3U2hsFWeNEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 8dYBfcWSQLIxi-FSphoCW7F52c1VLnY6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX1/hGnGcIJG5U
 g4jx9VXEfcN8C4I9330gH5j55QTWL8rim0EaatF0GNFa6dqqJEP+370V2jwx5pCy3G7uUPMdKF6
 e40C+zTScEVU+JQQ7KEVxqwtvY2eLrs=
X-Proofpoint-GUID: 8dYBfcWSQLIxi-FSphoCW7F52c1VLnY6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MCBTYWx0ZWRfX6zNhLi4h7qba
 N452UCO038vl+ArnN08I/KZEmj/LZ5YCMFg7DSJlX9x0V0vaCczmYZ1gA7vvvmk+ELUmwTiz3RC
 mkff8qquTxGHQEt735ieRFFaOMwOfVskfqAJN2BqeFSc+ecxqRq3du0Zn6OdsICs9aFf602z531
 eBYoPpUvj1fz2oVXMCq3i+raP6wOZXzJcu9Tnl4WyAChu5yqaX6mjxTWEaC8DL72wxc9Tjyw+6I
 CGetnRpYqvVvJWDnJJCRW9y1vPAf3UYHAM/IK3pQoN73wdFad81p45Vvx/oHLDcUyhb9sFuoL/f
 AhkUHi3FbpYrpv9B0tW5bIcXaDZl+z/kOq0ZE+co43Tdty0ARheSXEE+L+sfHqlMUlWql8wvLLJ
 CXDXBTtIq4Br2FBs6hXTMLtqkSfErH+10CMrGiWFXCONjgPjbj47YP1u5hh2gpVLqKp5bf2H0ib
 MrJDkIbF9g9zelxRGzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250040

The timestamp reported to userspace for a V4L2 event is taken when the
event is queued, which for an event signalling a hardware occurrence is
only as good as the latency between the two. A CSI decoder able to latch
the start-of-frame against the system counter knows that time to within a
few microseconds, whereas the interrupt handler that gets to queue the
event can be hundreds of microseconds late and is not consistent about
it.

Take the timestamp from the event when the driver filled it in, falling
back to the current time when the field is cleared. Drivers have had no
reason to set it so far, and every in-tree caller either uses a
designated initialiser or memsets the event, so the field reads as zero
everywhere today.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-event.c | 20 ++++++++++++++++++--
 include/media/v4l2-event.h           |  9 ++++++++-
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-event.c b/drivers/media/v4l2-core/v4l2-event.c
index 9dd2aaa95a67406bda3a257325442888895ed088..a35646c3a5c89febeb072d691ffd7853d9af714a 100644
--- a/drivers/media/v4l2-core/v4l2-event.c
+++ b/drivers/media/v4l2-core/v4l2-event.c
@@ -150,6 +150,22 @@ static void __v4l2_event_queue_fh(struct v4l2_fh *fh,
 	wake_up_all(&fh->wait);
 }
 
+/*
+ * Hardware able to timestamp the event itself reports that time in the event,
+ * which is more accurate than the moment the driver gets to queue it. Fall
+ * back to the current time for the drivers that leave the field cleared.
+ */
+static u64 v4l2_event_ts(const struct v4l2_event *ev)
+{
+	struct timespec64 ts = {
+		.tv_sec = ev->timestamp.tv_sec,
+		.tv_nsec = ev->timestamp.tv_nsec,
+	};
+	u64 ns = timespec64_to_ns(&ts);
+
+	return ns ? ns : ktime_get_ns();
+}
+
 void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
 {
 	struct v4l2_fh *fh;
@@ -159,7 +175,7 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev)
 	if (vdev == NULL)
 		return;
 
-	ts = ktime_get_ns();
+	ts = v4l2_event_ts(ev);
 
 	spin_lock_irqsave(&vdev->fh_lock, flags);
 
@@ -173,7 +189,7 @@ EXPORT_SYMBOL_GPL(v4l2_event_queue);
 void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev)
 {
 	unsigned long flags;
-	u64 ts = ktime_get_ns();
+	u64 ts = v4l2_event_ts(ev);
 
 	spin_lock_irqsave(&fh->vdev->fh_lock, flags);
 	__v4l2_event_queue_fh(fh, ev, ts);
diff --git a/include/media/v4l2-event.h b/include/media/v4l2-event.h
index 3a0e2588361cf451b3dbfc63dfab99550d13cf6a..076f788e0469ae4666c60344e5ea73a698352134 100644
--- a/include/media/v4l2-event.h
+++ b/include/media/v4l2-event.h
@@ -102,6 +102,11 @@ int v4l2_event_dequeue(struct v4l2_fh *fh, struct v4l2_event *event,
  * .. note::
  *    The driver's only responsibility is to fill in the type and the data
  *    fields. The other fields will be filled in by V4L2.
+ *
+ *    Drivers whose hardware timestamps the event more accurately than the
+ *    moment the driver gets to handle it may also fill in the timestamp
+ *    field, as a CLOCK_MONOTONIC time. It is left alone if non-zero, so such
+ *    drivers must zero-initialize the whole &struct v4l2_event.
  */
 void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
 
@@ -116,7 +121,9 @@ void v4l2_event_queue(struct video_device *vdev, const struct v4l2_event *ev);
  *
  * .. note::
  *    The driver's only responsibility is to fill in the type and the data
- *    fields. The other fields will be filled in by V4L2.
+ *    fields. The other fields will be filled in by V4L2. As for
+ *    v4l2_event_queue(), a non-zero timestamp field is taken as the
+ *    CLOCK_MONOTONIC time of the event.
  */
 void v4l2_event_queue_fh(struct v4l2_fh *fh, const struct v4l2_event *ev);
 

-- 
2.34.1

