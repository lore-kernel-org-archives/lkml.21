Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593626;
	b=19QuP9XzUm38oQMm98E1LY0KQaKhOLl4igj3KY82aMjmZbTnGKKBkbRFFtlCuionTN9k
	 q+PwSd9JuGAeLK/vwZu957E942yuWvhqGbPHm4x+8neecMMC3rQhWk6xovjCr7LOVIOqo
	 KsCeX43ERtR54K52rZlX7c98QbrB7z/0H8VHkAr5Y2aAe2TANOek2qCtFlK5h6Y0+4vaB
	 RrdsUB9d5p/yvYGjc1ihE2u/mUuhI6jSvNwh/CjGlL/ebZfQhyTJsgGPOQ2vUe8AI4Aym
	 zolBtiTm1etyfOOYWzchWn6lHXI00Ni/xhTRs5JHU8qFxyiuhf8/J5EmvixTnTW58ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OtpOi8BdB3iXAyuGSzLZNPeux0EufLwrclJTArwQJo4=;
	b=JR56+yVUkMGksInLmdB/BuMOHewZRTRMGunS+izEB8QrHJh3oJTtxeRf/x486PuXG0HA
	 Qk+M2AnHTx5Pf1teZsoqolM3GkgzltI8T7zhLxF//0rylLNOqW96iHLBgMJ9L4wbXmMmg
	 BkojV6IVUu5GzveqqXktIIBAAd+5i534qzPmJ/OC53qrFCg+FycG/SuPi5yzUmFwPLcHh
	 odJq9+DjdPp95hugVdBOXHrUjQvMTnPj1X/zWxFWN+u5+GVLqDvBlqnJlEzLiXCmDm2B7
	 hMg8LeYsPVjdwJ/J+Y/6Tjg6fMNHj6yqxlCwYIAIfY1v6WhJQg6skZFUhAzl/XJQv3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZbtfpBRN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B6460A3801
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16B6460A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZbtfpBRN
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68sHa3808067
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OtpOi8BdB3i
	XAyuGSzLZNPeux0EufLwrclJTArwQJo4=; b=ZbtfpBRNx0JTmO/nhCCGVgKbw/n
	1Jkh016yRjwVAxariRUHy85DybEGheo3Ysf3V26fBtL3qHYxowVTeVF06aKcwZv8
	yC/t/zD1CAqbzgZ655nQ4A27fUovem4B289ANuclkUgCAemzjZmFBbbQ3j9q0lKH
	VDuPWUFk4O8vuwDuT9P0fQgRTlGHb1lAMFP5L3Bu7YAaUtT96hvnqa1KDGhrbRDT
	Hye5NU2X2orV7IJzNsj2saPCIb0gHyT9/raNLSyjNGjwGIq/PqEPpzt9jCr4P6Gs
	+CmhidJuNJDJyBoo9g2KpAvVCdwSzR8nbMD9INcR6eOPkoMcdQ5Je++9YPA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkbm62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:00:25 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-920f97bcad4so95444996d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:00:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593624; x=1796198424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OtpOi8BdB3iXAyuGSzLZNPeux0EufLwrclJTArwQJo4=;
        b=ZpH3S6UCHlR+FVxC449i22M5T0h3EokhAI5NOHAAh/7YY1bfut9UpAcPgvDynebNcC
         4g4dcmFAVF8R7FzpueIayzGK1ie82whvXFa6jp0YZMcgjU51W7WT/MyZp1WvCbqFvsNV
         lUS2yiFrKMS7178zgwrHNejP2oQR2SDaJW7ZskruuwkJvKF+9sBZ531Rr1XoMHnnLzBG
         bNbnYRIuMn37rMlGYjaYgYQcGchWb2xQYyBJfjYpo5IUjPpg2GYBNRJQWab5Gih1DJWx
         EohCLSWzzA+9gvFv/ePpZRQNxxEF4U4lGLokZZrVZhBbXL2rLiJkF/lC/3UzxDUEcBaw
         wtNw==
X-Forwarded-Encrypted: i=1; AL+hErGX29J5kk/5XMaRu4L9C9qQdL48OnRhVK3aRSKv7BUoSvMcIJRdx5XlwRsBcXnlX43115eE484FPhoXTU4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zlB5/ywdQcFW6C7hVSKlV343+YF7pbd9gWqEGX+BplIATEaz8
	Qlr7Q9hKXK8ebb43ZikXJK0xsjSpIey4HTB0205zi0hrGk5d+su2nLxD861selk0QMov5Q5gLIU
	JGYSSabEdRGYI1ITR6q/P++lo9ognrw9cBByYv/UQYSsul13ZoKvDSczBAhl1pCDPzZ8=
X-Gm-Gg: AZFdTZefB1D+BPrTMLd5WarHMwLXJy1AiE0OcF1AwFFgxXcBGdvU5Q8fQolmlakZQyi
	EMAVNmUb03lPjC5xoSvWKg4Czc9820MUNzP7BB9muJmh8B62IJvKbcIRbXRp+Kb2oZquf6MC58U
	sIJ/aN4nc/yIAjLtpDkE1QfKKQIOUK5iZpt7W82QgkiCO3De57L98mN/6n8iO5H80g0liNzKhce
	62xyjPO9g+X9p3avlglDVes7+kBMlO6hEkGdXXY077PCmaX6zOmQcVoyzl9dIiO1eR5YjWdYuvu
	71YVWh0GLxBV4PGhvbH+qr4168ebycq7TX93MkS0QNhOv9decT2VDO6CrQhUl3QItcIaSS/lNq9
	uNAFDauhsCvbIowKrFnDNeWDhj7kKhHDM
X-Received: by 2002:a05:620a:f10:b0:949:5ee9:ab27 with SMTP id af79cd13be357-949bab4dee9mr2883045085a.83.1795593624385;
        Wed, 25 Nov 2026 00:00:24 -0800 (PST)
X-Received: by 2002:a05:620a:f10:b0:949:5ee9:ab27 with SMTP id af79cd13be357-949bab4dee9mr2883034085a.83.1795593623848;
        Wed, 25 Nov 2026 00:00:23 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:23 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 10/12] media: qcom: camss: Enable streams API on SM8250
Date: Wed, 25 Nov 2026 09:59:59 +0200
Message-Id: <20261125080001.2540101-11-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX4NsSTLnfdRI2
 udlRhElKTp9+S7HQB5tjpmIVW8HaKvBL2PvGkYN13Gt6DfRJMs+JaErSIEQ0JIsglKGWBXovZ95
 vHlpvLXwXOxk0wa3ml859LqmlzQK7AlvYZe7SzxwOo9yBCr/1Z7oc9hgHHvU5g3gkFVAOMCu6zG
 fmxO1dHDbfJpbkvrVt69Af1EXQHY9dKeaeJtN0KmOvO7T+xrgLoon3+xHDQuE/nhDIQWYxDgqMy
 86SJCaOKIFlWSI6a+Wg/YIbdSfTSw+iqaL0E4A/IkLXmj9OO40ceGgBj2fNjP/WTW1tNI8QRRSf
 pXFtUeLD9jkpo3ftJYfI6pY1nUsrfhd/2CVdyGVrh97gYpFCbSNSbgmiDBH/zX7OtZlE4rc4oJS
 +FU1uxguzAbBgKZFir/jhZbC4Vvibqz6Uf9MdNSnfAgrStTQ6/xXvgwqO5SKG/9xC0IfwcnPWOc
 HQAwFYn1++DqtCUnxJQ==
X-Proofpoint-GUID: m8LaejCSZ03Skvr7yrQaEL_e4SN_nzCo
X-Proofpoint-ORIG-GUID: m8LaejCSZ03Skvr7yrQaEL_e4SN_nzCo
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b069599 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=onitAmIIXR4QNx4LYmwA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfXyVCchH0djRYB
 H1uLygrPNgwGzlJNH0MldMDRMxnt8CDyfqO8cyIVMzXyPcTkEdln6tWjZ2arcfUE6Np1MOlGNaf
 yhXMdFnhxzSWjggxkfzRnceTSpEC/Cs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

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

