Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631043;
	b=P/xuQxgl6Z5qom3UkgEQB0MmJA3HoOSxgfdDgQU4o9kVfyudjJZGyIv64uB/y0QVywji
	 FiH3YVNvyNJLYpViVdVjs1yNQViwEka/+H/tmeEIs/437UA5NJiWD2tcBSrIdLtZ5pi8F
	 tnGn2NbHUdpJXU5LBtW7hCjUfmgOiKmll3QndqbPLAM2iU65z2P0Ga6MZjQdqy/Mcz/Lc
	 kXV/UJ/NzBrDqyZuwA2wSy7c5zdSM9ihoRN+QX3quhkY1zR6HtJlWKyNIP6vVWqz/pVpq
	 NXJGcQ+9YImtcH71Jv/hwi7h/BAOAmnhyMNsMY1/HsOYxXvfr49kE/qNIE0I0LyE2WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wRm18+EgKanEW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=;
	b=lL0zWpIQQ6lezNZwttXKgTZ+v9E4/gwA9w86WJTrV70wC+PX11BZ/m7C59Jbre12bmz9
	 sLsoRvitLuX0aRKUb+0KyoZxn4ChGAP7IXUdtQMJNHRQkV9zeWRWZmM3hiFanJQAbSFwB
	 4MobWSGM9jsIy5Q5ff6hFA8EI2BcEq45k8otoNrAnpbv/Kt63jNngzLi/OLsZtp+RTw/T
	 mYgUdcmJ9czQ3lM410f02b7vU4fOAJIkblHSFE3I4hDsJof+H+0gMc6EMuke+Smv4i1n+
	 QQrPmDIT7y9e66yWSZ2NlfcXEY/zxWJdArh6UUQB1sPUt94JrbEvSzIxcyqr5UJRA0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="SUWXYa/N";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fckkPCzs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1340606A682
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1340606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SUWXYa/N;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fckkPCzs
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQPV72375611
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wRm18+EgKan
	EW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=; b=SUWXYa/NJtM5c4/BVl/c6aZet2I
	UNm1dkR++rW3OPHIjv6k1Ug+PqTynZhKjcEJc+ELQozJAAV9eldzRM7Ir+awXYah
	UsrXhk9Z8V/we4qHLbtvWzBQ+ZHIF99+SeIpmsfjUQUc+9Nk/8zjDrAr0kOsBEIi
	KJjCQBRyf5/Fmm4CiBhESa5jsULdh2hQQFUr49bWF30CAIvNaCLM/BdfMazSW7YB
	ikd3u+muik91SE32ChDDt8n34KcZJE7Q3XocX/rOROwTX1AmqOUajHTm12DYI45V
	RFeCBpLufRnTYatIeRifSqpx5v87aX7yuyecJxnOuSIR+jsyPE+tC0oHcVw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61arh13y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:24:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94975041698so1498504085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631041; x=1796235841; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wRm18+EgKanEW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=;
        b=fckkPCzsGWS0j4GRXGa1KyNFHn7BSzeWac4GAqAwbp/d4aMcZ6HeZwGgf13mVssGQ8
         xLtuVihbB2/grH4gMMvj68nVdTgNPtJt6jaSKPDXzHAuF1ZCTZ82xabVuHWLxEEsVTiY
         ILdQUAb3aroq269Qu0G7Pe4e54gKdUl5uJV9EzqzXbHI5wE35Nk1hbQ30HFPvlz5pn/A
         uPDkWbVy3fY2cSmF8MV0yn0Sof0m7s3E3xBN68RI/ZzW0DxS0pJ6P89Vc0uvjLBoYl/G
         CcODN3EbiKyQWxUQwnovUsQRx6VfOuPaudAfEe5S3i4k0lNecnZGkWei/RcrlqkZtEbq
         LVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631041; x=1796235841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wRm18+EgKanEW0zc1br23SXCiZhY+49AAB/Mm37f4Hg=;
        b=T/lj7a2FWMDX0S4qT45pnhecOpt0n5Fr2qxHxGYyKfxgogI2bZczbaKzTl+KCfdA7D
         5Ge9impinsZ9sB8VMkB3Apamo1UUXOOf5aal1yRRK1gpRhEdjNdX6Ud++pYQ+Ng20kxL
         hGnecTXTMtmkEPm0WS1K9Cpn3hzpBBqO/VQ7vg08/Z4+36grqTsccXmtU4NYtNgShQvv
         r8gzj917uJ3w6bcXCBXh+LghLHZpwAvadnB0wStZKeCYAODxEZPaWpxKRkUZmjRmhFLn
         IUarKwoqvRvfbbezlBl1GcojSJ4rLnWI7fkmXCPcymgp9CfsTUApJEYiFPSRSsZ7Qqvd
         pDyw==
X-Forwarded-Encrypted: i=1; AL+hErF3W6NWBqTahv+HN59kv89gThmn8Ir7lnred3sTqgQdOB7wl52rBPOpFJXPuYcZXRC0vobMz/KrCwO0RUQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ePPorMw2of/BQYSNXaVC/O0pOL42mbscxpeep6YefZ+BGofkv
	A34u7VPHlkIoJRsfs2pkJuQZabZSKBqmTfwwG0o5G6ELJCCRh+h5ww/Y6n+UL5Eu3JEGirGzwR0
	6Dn1cARplZvWM/2CwLWScQgX+8pDAiT8Z/noSOPFIxkZJbYE6hwdqDs6pclxcWJjvuXM=
X-Gm-Gg: AZFdTZdlKrIF9FO30PUZLyY/2H+OZ711v+LHnekXaZFDOJfwqMEv3NMcqbRa2x3Fybn
	8K6qZlt+iAH0+Tpr9XJzcg72Is2EuVA2iW16g+TF5CaBclxKy7bqRZ+1mR/ta8WDLmrulV9bPzK
	Su5Idclh1VowDeLgZDDfXIrqiKQJLMFf19iBhDGpkE4FiRSo0yaEt4zT7aM80Ev2BSVZabUjD17
	9KI9TJVDJWlQnW3xoDCynjmtf7jIiX29aCFxE7DJro0wmt+JJfPOLUsIopMl5YEuzbaaPLL85cq
	QQSIVZM6rW4zyeZcxfWrainY12tMfF/KFchJZq9YOc4JQ/fJc8o0dTENuspj6Qsvsc6jOcSs/VD
	5imTsqC7zY5ldEo/oW2r1UYdmSS/wF8tJxEPnbTCzQ3ghXJfXLVAmm8TiQ4KjpNRvjgIu/Z0MIP
	3u2R/n
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3344686085a.30.1795631040799;
        Wed, 25 Nov 2026 10:24:00 -0800 (PST)
X-Received: by 2002:a05:620a:199a:b0:949:aceb:b77f with SMTP id af79cd13be357-949b36034edmr3344681285a.30.1795631040255;
        Wed, 25 Nov 2026 10:24:00 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:59 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 11/12] media: qcom: camss: Enable streams API on SA8775P
Date: Wed, 25 Nov 2026 20:23:25 +0200
Message-Id: <20261125182326.2767771-12-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-GUID: EjEvw9kKakmCcT6-W2Wm-stVBQzx2iH3
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b0727c1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=onitAmIIXR4QNx4LYmwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EjEvw9kKakmCcT6-W2Wm-stVBQzx2iH3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXy/cCgRdHfcwk
 JsK+tUoUVS3mJOyO7gL4AGoJJRbmCx9RMg7sOlQDFM0Rt/o7UQt3VzV1BN5AhE+hqmaB9IYzgAg
 TavqbeU2ZdCYqiCfpC6nRuvrO7kK58A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX9ajnRjjWfCzS
 DLfkTE0D2sxmdZfwWVvJtap5Q+B6o/kBcJL2ZmiXSV4post6WIcUM/gZpfXt6yYjIZMwqUGKGdT
 VtkX9IqCcdl05jGfH+ZkbAWcB3SYj47gkiY0VmXnFxFNiQXEPbKGi3EYildc+WlO7lmiIU01KJq
 Iu809tZpfkqLtM/iitLYoUtaJnOaVHgKAOZn+o8lgpfOcmwLMEZh29soRj+17L1BfmpVgK9YBZO
 1vUU4Fk8hCkBW688D81QoOJJ+cDFyWgBWXI8o8seLNyB66zePmwiOiQnz42D2voS3kVuTOiBhhy
 1+wEFBHnZK3df9pDiJnqLuqGHpBjjDDVfdmt7AD1NILti8dl7MRpCNwcWOOWmYIDEPcE4vNpVH5
 7SWEHNgnhUdrhOa0a/xDlk1N6DU+Kr3H7i/+Dly30ezc6dnYh6kdyZe19STCb/ITvnWzPWqNWC3
 OzRb6eNCNVUtpygJvTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Set streams_enable on sa8775p_resources so CSIPHY, CSID, and VFE
register their streams-API subdev ops and probe with
V4L2_SUBDEV_FL_STREAMS instead of the legacy .s_stream() path, same
as already done for SM8250.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 77fa80dd79c4..e444c29fe847 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5719,6 +5719,7 @@ static const struct camss_resources sa8775p_resources = {
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
 	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sdm660_resources = {
-- 
2.34.1

