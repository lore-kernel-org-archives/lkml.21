Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631041;
	b=5U9GJWOgDxcQSFj0D1HuFvjlN3snitz82OqgiNXGlG4Wq7R3kBF575TFkdotlRchDnEV
	 Y/KjZjLfpkxWreYIGOMgUBbOFs/DsWOnS8+Iird0j6UwNGMQeP5DY8ulxeom4sUHL6FnD
	 ZotAPYqwKAhs+5DYWxU8YpWIaeBJ4Ip0IVeOk++fsXxKqgQRT6G/SCcgKqVdy/BYtv9WR
	 j/xWotzcPJhzXQUzazBbKlDSSEtxbtfnWR7MjHD6542PxjuUxb5PozzBEKLD5JmQbScFn
	 78n7UipVBZE7fjf6WE824vMzdRMPifIgnyjiuukdyVeTKVKCh+kfdmYtzDRQCvfSFkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9E9zgJnH76UW6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=;
	b=UCNRFs8H93GIziTQmG6Hfjkyj34kz+lj5aTXTlAptxuarpVNZXPjbPGK3IGU4D9A7sT7
	 sEr3VGEMAGNb4XmwEgGMH1ExiNyfKUbfAjKPkY/bhPv77K1uLLwyY/sPxYbFepGxfyzeQ
	 bnQn/X51cNvpkweUvvrkQ1DO6B2YO/4++rkCuWjYUlVKbqGXKi/KPs5ahf9tcVbULqN2I
	 ArOLMFeplXyLbUMdAwycH8H3kw2itH9bw2/kwSrKHjmPHWLbC+irXYHG+AtVEpImmsJPc
	 JR0/5YYDHUWVuhKXNmbmtrTBaO6706YAGo4S7Vo3Omep80Yn0XoALwFKX/H7+8uiQOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SqGYS5HT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUDTglo+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3650606A6AD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3650606A6AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SqGYS5HT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BUDTglo+
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQ7xt715137
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:24:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=9E9zgJnH76U
	W6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=; b=SqGYS5HTm1csOaxXxCMfFuXhn9Z
	0cc2pROyHUvKtsedRPvVu2TJ4VQ+zO09gZm/lMX5FF+r+XVvNKj1ZZuVUltdlN+3
	7+DtYym3TcOz6ParrlWos6hdJJimjQrHYcwR7ECOFF9SngKEoBQ9UGrK9qw5fDP/
	843eEGNB71/OMDjMJECiZ/5DVRNtr4wDbhQ3XySS7NALWFRb5I3ZfCP3j8KzQx8J
	IHNHc0wfE9NEa4POobVGTFJXr3JBhuogIk+Kowj6+PmUCw4oCfMdLxECtH1RPxCk
	dQ5D6dU+JUCBBYR/Ywier+3jD5/Qo+CQZ3lZunpr8tZr8Eh8ZOgn4WB4oEA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbm5qe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 18:24:00 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8b4d1cfe3cdso12203217b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631039; x=1796235839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9E9zgJnH76UW6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=;
        b=BUDTglo+2c5M9xNp3bSXFyoKp4mep1ERhhvVCkAMxz0gp6HgL0myBR/HjhPB1ZJKgr
         oHrqxCJm+QoIFsAriioHtB6hJDjevBKNhl7o4neNU4Uojzkag4DGMI97swRJCH/uHCa7
         g8TfQPH3dQgekN9aW2ZJspjtI8DP7IZxXP5CNUNCJ30rKoheKTaQZY7LX1TfhJw2XqQr
         QdqOBt9lSRbS//0OwiqDm7Ebq0m26VJtzoam3854RlLGFI/DsdUMJDJ7pYEkRrP1lVPo
         SWWnge15bddqbXeD6/4cVglprVBzTmXWtAuEbl2nI7qZ9Z1vM/AVkTnchbCoRHvHsjgU
         xtWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631039; x=1796235839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9E9zgJnH76UW6IGTQ2QrZ6yug4fWhoaEl9dKIjsNC8Y=;
        b=P+LqkpCDJ1nnN1+ITBV7iXLsTB4+snNEI0dyBvRwSV8MPoHkJ6CUdbqVtTD7PqUjYG
         IBFJp+1H3ljslfh7yYRxfadh6OTfUuxZLI4x46ZjKVXDYSIxtdd6Y3BrNx3/+JcK8uu6
         TQdj1EEHNrOt0fS+YQUPlExDDMJjGft898ef0W206F3XeIC5uCPLMRNX6FPNKU9q1fFC
         v0dEEU1omX58aJglgyej7bvnXXAGjaB6urXHbDl4eTarK9D/FmkrY4Q0OAzQRs93VbWq
         3886lmjW06xR2XFctJ6lU8fW3t2nBgKtb/o820K0hWgowNWwniQvQscdulyAaj/F6FSc
         4jeA==
X-Forwarded-Encrypted: i=1; AL+hErEyr/qnzeeljuTTmP5/PVEzN20mH0AW1tdKvmZenD0iD0zXZgGnrE1j+ThfoZGjszvdTX3hhzRUehBLFkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x2nUOBzohf9a2AHCIqbz08III6cDmVp8NBOoItd4YjT97i/Jd
	r8pihA+cxENQrdcMDI64oq+1YdbLk7LEZQBFwPyKCceMVlYMRMa5hTGpLibwyPN5CSxWFwjT76m
	CKsGHxbFIWOH0gAwo0K18IwSI+Ksf9a80ofK7DHPbwqFPuLetUtNKoMjB81FRyUwaVo8=
X-Gm-Gg: AZFdTZdAcZOLNu5H/72TyAXEBtSuiUKyV8fBXEutQRbIQix+v/Wl6B+B47R6L/lC2x+
	S+RJHy1tKN06RFXx1vTDqBiVCyggRZS22uFF+oJM9ydW8jG1/PQFBkQIukOeHxbBX096/aSQF3Z
	OWAI6zWAWSRrPCTguhScrw9BNuDrvtyt/NlVhI+3CBL8NSp0hFmW9oqy1Y3RrNDsJ4MpAm/DIVx
	l5A24B3G0S71XBsPoOQ7eRL3PJgqLFIjR5GqrlM2ke8erm80UTiXY+CsUE2Ls+R3KDjNekWuqwv
	WfBCG/QAXGHk1wMyL7woxW03ayjH3okEKW5Vun2bdGwjqGGdhNV3JNa/RLNNyLBe9o6PFkjqj1M
	mcerzNUMc2XqW0oumnUGiv60yOQ8MJTn9KQLrW+UaRZpkcWanaJRayYMzdQaJcPj1NUgv1JE9qP
	MrJTAs
X-Received: by 2002:a05:690c:888:b0:8b4:dca4:56e7 with SMTP id 00721157ae682-8b5204d6981mr75797997b3.45.1795631039255;
        Wed, 25 Nov 2026 10:23:59 -0800 (PST)
X-Received: by 2002:a05:690c:888:b0:8b4:dca4:56e7 with SMTP id 00721157ae682-8b5204d6981mr75797867b3.45.1795631038670;
        Wed, 25 Nov 2026 10:23:58 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:57 -0800 (PST)
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
Subject: [PATCH RESEND v2 10/12] media: qcom: camss: Enable streams API on SM8250
Date: Wed, 25 Nov 2026 20:23:24 +0200
Message-Id: <20261125182326.2767771-11-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX7X4aLog00ZCa
 4k0rMpKSL0T0tYM9IGcZisZUV471asFpCH+koQRH2l8PwZyJR5VN+hSBEaMIQCjbAf9anYTWO/c
 z+J+u5aQdAhX4WxVKFdve+382Qes8T0=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b0727c0 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=onitAmIIXR4QNx4LYmwA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX6nHijhnqH8K0
 bAiFuO7pOnUpdFhYSvE0XiQV+vP6BRKvYCKQf3aqL7CEbKtzgDdVGGFSHYqapYUvi3TLVzve0vw
 UUSp3aK44mrNwsIpNL7eQyFfdyn4oyzte7aHEmywv4iJNwohXJXJiRPtO8igcXqFphgy8df+HpM
 35EXBAO8xqTaYpMTfHf4pMB+VyXK97Wzfmnwe4UHnX6nmW2Pu4K6b1n76z5IXr0j2eiKbED0BMq
 1bIUP7GFVwdYUiiSCpDsYsuSLdDBKNomsq+ptBl1GSRdk9B4x2YpJE2dDaYZmomxcNKeE7CvxTp
 hg/jZcrn3ysMqYh//DKdRhl0OBwWn36MdTw/4uKSh0yd3irIRWRmMZ/wi/9oCXrQ+k5hnqxvKu2
 W/QuzCdHHqlubluIwlvnhVu/QLacGkqBX2ai5OV/5luxEHRmZjOhAhMPxUvAzI4OIxBK2bRMNm3
 BpBCNxffhBDYWA0HA8g==
X-Proofpoint-ORIG-GUID: FZBJm8EKUfAR86p0gKZPLii84Ur5N6DF
X-Proofpoint-GUID: FZBJm8EKUfAR86p0gKZPLii84Ur5N6DF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Set streams_enable on sm8250_resources so CSIPHY, CSID, and VFE
register their streams-API subdev ops and probe with
V4L2_SUBDEV_FL_STREAMS instead of the legacy .s_stream() path.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index ac12960264ad..77fa80dd79c4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5790,6 +5790,7 @@ static const struct camss_resources sm8250_resources = {
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8250),
 	.csid_num = ARRAY_SIZE(csid_res_8250),
 	.vfe_num = ARRAY_SIZE(vfe_res_8250),
+	.streams_enable = true,
 };
 
 static const struct camss_resources sc8280xp_resources = {
-- 
2.34.1

