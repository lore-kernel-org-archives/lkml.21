Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517863;
	b=Sd8HQhyLCzuQUgjefK5RmTLXWwm2I70BzuSQiA4Zn1kADrR6ycYqTKbr9aIlgaPqD1M2
	 Ak6fY3h1Ke5De+tbS4V3Df7lVESlhwYJXZCoZPdYplzoAlJHUnKB3yEDmA+NgN+qI5sXv
	 oaYr1WyVZ8o5qgNiizWMht2vyEjA9mt/ACxGh9IRFn3V9g9FcqwVZp8Y04xNZoBm+mW+t
	 0K+qmBAYDGbz93J2oI2V+eDKOspxaDuWRP3Q4I+NShesPVB7eSRliq5jaHS4tDb4RwNJQ
	 D3o3Tc5jd6WjQWuhLk/C8M4miMM9je9ataQhoYymVUHSElFu7eQ5ibdryWVNLOO/DBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517863;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=;
	b=HYn90qN9BMFzFblTWbNzqteF1igsZolkmpeLt6HQYnYHtIv6fq5xUPR1StXMpeV5Q2Gl
	 EYQbDUlcMLyWsAYkJ3fVjmPaKLbHOJr11H87KUtL70qzSOAUSkpXWLvserVgmBMXlNDvO
	 8CZHSWbRirh+XrWuSEdNF2E/jJ4pQskSHGW2+0EUtbQnd3G8oQkpWf9OMBDBIvr8Oo9IZ
	 g0SQlVVQDMx2rYlNoSnvAEdSxH2Mot2okuzMzgBdRzhoC6Nu8ojcDCP2bBYOzr7fUub1x
	 gvhykzM4vLnpoojSZwIhrefglZ7m14JRqseUVZT/A5lgfeDrFG86U6c8jH1N9mKD7rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv+hPwVF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JfqILFKT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C574606A68F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:57:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C574606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fv+hPwVF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JfqILFKT
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOAupZP1113692
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=; b=fv+hPwVFsRVCqLcz
	IAcbNAoo2HKXDnyKmCNtqbuBY0XoM9GhCzq60iZzie68Qt7XgjuwMen0X+G/8rek
	qRDaZGeWGJgHQSZgE+5y9DZEHjo4G09q5Flm/jM9aRYYnXBJZpn4p4GykxXrGRiY
	QK0SNKNSMENXJ/2HQqbUGjZpUehJ2HR9UWuuYIHFnJMwXikk45yVn5AZovl29rEd
	9WlWIFDKxnviiaACWpot+I1sSAfp3L+bYX2Wbyc7tMPg9HM8zZkWK/QSvnx/Lo24
	MvaK1f2y2gpU1PiF7CWdfP6e7ywvtx0grZQb0sFF4/cKR1P7hLA/rwsQCHtnihR9
	sa8I6A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nueqb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 10:57:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-947a607ec40so416868385a.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517862; x=1796122662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=;
        b=JfqILFKTiPAtykCece/2GNT1G4DtiNpxjn/fVvXg2Aim/T4FbQab2eWmz/prGsMUSo
         3cyb7kKnBZyoeYqBDSRdt60fVKfGadbubjT7/NTF/RVS64KwQE7+ud5By0SpIhFjWckZ
         nbBQ31EwxaayYMywqOg5LZ6xZx07CKgKuO68nz4l2FjuGNZxNNDKgM9sfw77uQdCRPGU
         HYwmxblip8t1ezXoZnSBUyrNIVaX7Oe6u24JHMNLnV2OiyXPIfPe80WNH7/rNDkOrHZ5
         alDy9w8sbUZXC0A4vJXMg8CsjuSpaDzAhiVWZstftvafwo4LO3gBQ13/D1aPZCrIY6L+
         0oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517862; x=1796122662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMm5C+6m+dqtRJM0hj53gmIHOtmjDMO4GWXIMwBO54U=;
        b=seowlvC7RIbbFq1UZ7up3kYOEE2xcCvV4PPDezfIL+qvaKX9k8RCqOBQGXk30ciMnN
         tLCrFp4CHdJfE63KTu5a0eSAgDw3w8ima4hXCxNHytuIO4coQBDRL+iAHG4uA/5cVFol
         sj6zO2tSBQd22TrGhx+jUcvXD6uGWf3Z6t53Fayn8B5UyaI1RZbUnnAl3yC/KE4KhmgG
         8ozwHvJ642LyBD1lLE5bJ25FPxf469ACrSYVrG9Ntck9evi6lmo2Nw65GOfDl65I7CeE
         +MUVl/q5jfOOoxpS+5NwBtm8jbYj1tz679fJKCLV5kqGCLbZ9RyFubzkrX/nH+lTp57I
         evQA==
X-Forwarded-Encrypted: i=1; AL+hErFN8r5M2rR8xUm3h+jfHgVY+RlZMNXkYEzqzr9ifuBRuK6J3xOyFdVjPRiO0I264THhUnBc5KabzcyvtSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ZWJOGpnM5F5u1NitXJ1W7B1/o114sWpTc0roR7dwIFz+pr9O4
	Giqb/ZilLZpoD6o+fCv34eH+1/2JEHsT5RJBWRvRMTb3Pg6C85S9suI29RZFictJ/T0bCy0azG/
	OvY2eTDtRuTl5+xw9oDfRdep7Ls8MyCR3vnxUv1/Wl50fktM0DsiYW78berMKcwqXzck=
X-Gm-Gg: AZFdTZcrScqxJiwf26U95M+lVLvE4hsryssES1qAzcHcW4R99IHZDe4e9MGqmsldsiL
	x3hKaXsKwrW6zKbf07v6PhVGE9DajqazkjGdmZG4bToc30PDJiMjzF2LlvPWhpiHcIkJPaj3mn4
	mFzGGdDzWsqkESBe+ieMBDR+2UrQhk887EStsaRGiOQpNQnpSBLxi61DAiWPtubui7sXWajnyX2
	/wDsozDthnIKCdwU8zfnsqPNiJu5vdjKfTe6KYtXt0Loe9TD9/Y+HnHUoILS0xryFbogwnMR34m
	2JjCnBZYRq8TJbpGPCUWydfhTpkoB58WK8chzsEkD9PqmTLcas2+RdJ+Ttud5i5vByI8YzbCKQf
	FR4edmyh9d7JnDpK0zIq2KiMreP18Rr4vjib3+OMXd2AivnBBXeC4+u0F
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr2710099385a.23.1795517861669;
        Tue, 24 Nov 2026 02:57:41 -0800 (PST)
X-Received: by 2002:a05:620a:4056:b0:949:7893:397d with SMTP id af79cd13be357-949ba9b8ccdmr2710094885a.23.1795517860980;
        Tue, 24 Nov 2026 02:57:40 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884ab091sm612415085e9.11.2026.11.24.02.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:57:40 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 12:57:23 +0200
Subject: [PATCH v4 2/4] ALSA: pcm: Report writable chmap controls as
 variable
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
Message-Id: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-2-1197ac8eacd2@oss.qualcomm.com>
References: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
In-Reply-To: <20261124-b4-sound-qcom-x1e80100-allow-ucm-channel-map-v4-0-1197ac8eacd2@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ric+pGuXgkY67TTKo3amOZ0wmL5auh8AHkx7rZk/1VM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBrBW2drfmuTZfjC4r6uwFV5T0RDMhequAw6Stv3
 +Cm6Hv8TzyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCawVtnQAKCRAbX0TJAJUV
 VhJBD/oCJSyiFk27dHBL/2jIxT7m3txNdZHwVFYVCXN0xfU1ZOjUbsSHaoiro2CKwQwE/CxGXvM
 ZsAtrbd7ZD+mMW78C8W0gWRlO8XYrwyxpsvQprGUVomsI+m52sNlR+0dU4K9HJ/be5v+/x94FZj
 uaMn12msga30+BpQRMfwb36JqlLC5h3vsIKNSzfBRWTOvAkfrbglI416tD4ggcKOEgGSQwHPfkf
 Mx/h7GuLzrv+yJVtuEGqrwl9VTd8DydJWbsTsswrK3qdDF3xWiJZD4q00DukCp6uaE0YnKU1dWB
 VNLSffCYKlyt1KFWeQb6l0ZL/NogFazutmkF0f+Fr1rw4fAQtosX/Rs11kdsRC1rOQhLhJUMe19
 G+vUIFD3g3cqbJugbLIJzeZanjqLipwLqctRNOGHslEl0Wy9xVa+OaQKaKUq+uThYawUYcn8fyh
 ewm547lzQptxF/VIRcpQHYaE1mPe5dkVu6LXuCrPAenoIg7TRCw5WoyMdWPrsQQOszkrDsz/AMu
 K2zqUqBcJByume1F188ghpNZp+a3yWxFSD5KO0YVEppanunMJaFFgVSsM8QmL2cCzkixS//SYrz
 ff5aByPC113kfHS9Ra1NDqKR16HPDT4wDDWTRYesN43fJ9g299Y5ItrmaaER+2BZBWHJDAkZrma
 5IeObS3IBywkPzQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfXyOj/1qUQ1KPb
 PDmp+kBTAR0cwlPAtrfDpoIxUdWtOj1PiDFO1/hR8ZeJrp4DkmOo4PW+iYnaaaY/QONp9F54qRH
 G8RzKwqGQEsgyRhEuFWzHVD5Syy1rzS1ZSYc7cO2ZYtm5Ddc/OTClFN5OCLx0EA+nICuFOvMFqL
 WBlMrGATCbB0f1X1KFrH8a5bC3LRmRl/ujkpbAdTb7v6eOvHYLCNrXceGIW5zuNdwp99H5+3beC
 wPVOAIzYhBYt6xl7QHloQ0hMkbBw+T+nhzJKbOkKHNwMwrV1fUqC3MY8uciRkWGL7WIGGpyLf1M
 /74vM6/woibHOGLEvuUPTheFkH3woTMIUfcpSTQubobuNZ4kpNvpqu/vtsnRjAWtQssfSlcT5f2
 Y9AOeMqyo/LcmybtA2i9xWEqEm0hnop6/xCdBOmGrBDj8CiQ8MdT+zE1GJcg2ehO5ARWjFk1YgB
 4t0a60OG+tO6td4ZoWQ==
X-Proofpoint-GUID: FQ_X53mYQu4b0qyVl3G-tqEwkuFwL2FE
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b056da6 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ukOy2RhdxH-JRRExvroA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: FQ_X53mYQu4b0qyVl3G-tqEwkuFwL2FE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX7+zb7DCFwprm
 XOT1ToBNVKKLDgWKXAkmPs9QDoXi/JJriWkFe5TFHQrtTyADcOUKB/ocy7O+iuyu/RdkZxaMkVS
 tFa2zT3+L6e02up/jTqy2e4Gh6J9Wv8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

The chmap control TLV always describes the maps as
SNDRV_CTL_TLVT_CHMAP_FIXED, which tells userspace the channel order
cannot be changed.

A chmap control that accepts writes exists precisely so userspace can
reorder the channels. Report such maps as SNDRV_CTL_TLVT_CHMAP_VAR,
so tools like alsa-lib expose the map as freely swappable.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 sound/core/pcm_lib.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
index 6806b1d258f2..219d506fdac2 100644
--- a/sound/core/pcm_lib.c
+++ b/sound/core/pcm_lib.c
@@ -2539,11 +2539,15 @@ static int pcm_chmap_ctl_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 {
 	struct snd_pcm_chmap *info = snd_kcontrol_chip(kcontrol);
 	const struct snd_pcm_chmap_elem *map;
+	unsigned int tlv_type = SNDRV_CTL_TLVT_CHMAP_FIXED;
 	unsigned int __user *dst;
 	int c, count = 0;
 
 	if (!info->chmap)
 		return -EINVAL;
+	/* A writable control allows userspace to reorder the channels */
+	if (kcontrol->vd[0].access & SNDRV_CTL_ELEM_ACCESS_WRITE)
+		tlv_type = SNDRV_CTL_TLVT_CHMAP_VAR;
 	if (size < 8)
 		return -ENOMEM;
 	if (put_user(SNDRV_CTL_TLVT_CONTAINER, tlv))
@@ -2556,7 +2560,7 @@ static int pcm_chmap_ctl_tlv(struct snd_kcontrol *kcontrol, int op_flag,
 			continue;
 		if (size < 8)
 			return -ENOMEM;
-		if (put_user(SNDRV_CTL_TLVT_CHMAP_FIXED, dst) ||
+		if (put_user(tlv_type, dst) ||
 		    put_user(chs_bytes, dst + 1))
 			return -EFAULT;
 		dst += 2;

-- 
2.54.0

