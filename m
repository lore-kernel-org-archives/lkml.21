Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178454;
	b=0dXP9JGwZ+k+0wZEknE0ZyEEzzbiB+J5APaey1BxeLxo3+CA8iI6osHJaTF5kvyGEfmD
	 4Opa5R5/F7RfPNCiDz/fziOcrV3uL0wXSRlJscqbzNwNBj9x0febuJ7cA8/OMrRGmwi0H
	 Klm+qKl1tri4Bx1KT56UOe5t2HHdNuN+HHXwMF7LPm3n7b0Skwiidy53D7lhqcedlU2Li
	 bIv6JCStdaHP5dL1qsN6VTfJ8J/ncBUMlVwbXVZh8dhduwuu4jLH3kawj0OspAIiGQRKY
	 A4+nlQ897do0OuLMgDWt9UzLmzDUUOmUYXUbvGeU7Rf6Dsi6eDyo3jr2f2goXr1LTaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178454;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=;
	b=D4sRCy4D9vPH4rT+kSZ6qxS9+XwlR+5SRvqUn1QVlynPb0Q04WD2QQuPlB4tfX7fifuY
	 GGkeGa+or8+Y8KOJZqr9aC6wSMGgrBv1NHCH2vCZ+Wue1XquhltAmFxSvxpgOctWaROzi
	 TbP5BwUAhULnuQ3MG36MJ72VDGGDY2+ZoHEhYN4eJ449b6nvlOtl8wclQze05ysYRfYmU
	 h5utQXY9f5RCh2bdsRZx0Q90MHrvATnE2gJvQBaK8z8kewDg5pXsX6WToEh+/2SR5ln1a
	 qw6d8Z57KOfNkatFue9c4iQbIwilEEydAZeXNXndxq5be7lYox28GF2ZXhjqI8lD2/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XBxjmaAK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJnKocLV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B71606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:40:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52B71606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XBxjmaAK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TJnKocLV
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk0V41168978
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=; b=XBxjmaAKzcY5UscK
	5YD4LSx69w+xCTAdSAr9bYg5ti7fg6Ha3cav6oQeGTaO5APW1wq050lAb7FTHKgf
	snUBdfsNTGm6DzcGkpLNyi/Lwd4qebVXpIO/9HSr4MaWiCNN+nT5ffOL/x+rCTXs
	p2K2zJdr83g7BC+TYJfP2mshHR11GaZaCF63LMu/A7MUCyE6i4SEQYByH30XEAqg
	BpwRh8K/ZHF1wjx/mBvX+2sacp3L9DV2lJmmtGwpElOAW5gt0+uaZQHZ0gzHo+3v
	YEXgRJF8L+t3xB2G9wHpG+T4J5gsL02XPaY0tTwAl4SR7wG/HJ7qKjHJk1PrrbRa
	INUEJw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5uru4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:40:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9496ff065bcso127562485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178451; x=1795783251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=;
        b=TJnKocLVeU+LkqTAJDdSmp7HlO6ZrVVOSy9A9YjHbhGw7smjKhmtijpNMtCQw4yQv2
         D+04BVf40w8JNzisPisc+qX3DJtF5kaHOYK7A6l+JrupeEp7RJrc9g6skPi4L1f+M6Kk
         gLwMjEPyd0Xsdg4pP6yu8z1xsj1QzJbpx97IyYLiDlmVLqEasAAa1hqTpmg89W57OAXi
         YYDEt2a+GGGZtgENeYTgVtSXhFYmp0jBeI4qSGArtK8xYt8FYVqdt/KDIJFe5BD+bQjE
         nHruhlL+GH77Y22cHzCSKv9woo1qcp5kXftP/uzfEHL4Yq+vAJxjMYsJSmt1Aaa0idDp
         nimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178451; x=1795783251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YzbM14+AVErrnq1KBUQqneQO2pb1kMeONOhiFQwSLds=;
        b=zfezzp+rRwtRy16XEndJon183/jkhxIfRtmZqxe5o1y9H7SH7Kq3p8ybaW64AAJvhH
         pvo0UAdWO0v7IApWt1SSFOxAbPTUoUqigGN1uQX6PpBrQ1HBBwNia6OjXNPrlBOowjgL
         T1ChftekdjmUiDrAB4F2xiA5zJDCeryS8WSAjzNcybA3wZdSk3AoAGM8lZ5+XqYZe2ym
         Nbm3Hj4JdLlyXzw1ldVuqDcfPlOmrzd1VxOhyErxtuylbgEFtqjkBX5+z7rzSJPTVHP/
         0b03PRMxS7dOK7/0OH4RRsStt1N+6z8WAQiSpr9kjHLXZO1Ztpf5OGfaKqAksIQHUPYs
         VSqw==
X-Forwarded-Encrypted: i=1; AL+hErGyLDjZsIZ2nhL4xl/K08cHjO1jKjgPudmEOyhGqIbklznBsRl7fTo9OOnsbHmUuUMG47+bkH9vF38fE2Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vEIlJDw7GTDtegX2wtUIW3Q1lacIeGhi6qwLcbaJEhj1zr6Ub
	GZgQW6o4LBxDA7eG0jCMR8YuhjhNloR6PK2Az59bzBYsOQHCiBe16s8HHt0dYz/5qv8QIBp01kX
	LC8iAiN1nRSTWqppL999kIdr3MLKaHYhvLb06lHfVymXSe6SGWTKMPCzdTMhSdA5BUuo=
X-Gm-Gg: AYBFou0G535uhNdU6R5vbMI0tah/a8G9pVL0CzLhG2EMVVQksspZlv+1n5h0M6gsGOV
	Jct6vGnpx9/rJK6KNsS8q9hUcZLlLYpgo2HJKUdAl9OHXtpb3ItwRU7NPvhdrcS5C1bfsYTjlOa
	7ttX/kQJJ+4PZXPVYRDbRxDAgsqTyBZNeaairzk13G2Pizbdl+y+3xqrJQeKDPwC/LOjuIeadnZ
	iHj4vISGMdM0M5zVb/GL7uFDAr9ASG4+02JNNTZd9Dz1sa1VWbLwstdO4d/iwQPDi5hBzRWCUOp
	7mhKhv3t+OtCmupOK5JcIqK+Mmi6Cu6zWEwVBbK96Kb3sUJWYjxG9pcL6DSed14VLcF48eSiK5g
	2xEFEre0AVZXHmBxc5ovEMEbmv/SIuuDnBzHw1CfDncjYAtbu1UqzdYHPb+6Q9QwNRjkGOtelm8
	g=
X-Received: by 2002:a05:620a:1992:b0:949:743e:9149 with SMTP id af79cd13be357-949ba8239bdmr475452985a.6.1795178451490;
        Fri, 20 Nov 2026 04:40:51 -0800 (PST)
X-Received: by 2002:a05:620a:1992:b0:949:743e:9149 with SMTP id af79cd13be357-949ba8239bdmr475449185a.6.1795178451020;
        Fri, 20 Nov 2026 04:40:51 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm4234481f8f.35.2026.11.20.04.40.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:40:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: fix incorrect pull-up reporting
Date: Fri, 20 Nov 2026 13:40:46 +0100
Message-ID: <179517844379.14049.11659157399777710304.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261113-qcom-pinctrl-msm-i2c-pull-up-v1-1-0eaf5c154441@oss.qualcomm.com>
References: <20261113-qcom-pinctrl-msm-i2c-pull-up-v1-1-0eaf5c154441@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX4at856MMde4k
 iDUhLg18I/FESIB6xCBBUwQoL1u2kHC8h0bHcLP3koK54rNGGdiGnPbN/8I9h7y43GXwnkE4ZQP
 6LOKTSr8dg+vXfJrwKXbY5NetDQNQLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX4h5qB2Er5Aq8
 GM1rhwJCAcVspBgIj8tVtxN9ZtD/zL4oujTcBV4tnhyym8eoHJ75gRwcuMgwijVg+u6dccjEq83
 wxot11mrZ75nwsXOamy4o7HnZQ7nbSJMmOrbmFU7/p6DYq/uYS2MnA/6znuRteo5tp8TFYBk21e
 WIvYEbe+ITkiBX5EqfUXW4+ODHl5zP6HbJ3OvjbP9FPDnfrVIG9E6R16TpkvEtxG2ItBJVGDNDZ
 UJccG8m9fhrWNM1yHvN9qCv+pR1C7vTYr9EN/l5RSMXC5QbTpOq05mS1oQIdFO4WtYdodCSB5Bc
 AoVfW5GT1JwWKkdg2/ZGm7MuNSPErOr1CB+6x8UQ7RnMKmwRNy4bVu9kfTTEPRHLrfFIVEthnwN
 WUbEnakfwnd+W4VdBuFaKtntzFT6C9wo+FcfZ6RwHiSOazhsNRErXetIIMyjpytW4+DNcMaqrlX
 /M9yEEK3YYcWJCj7RcQ==
X-Proofpoint-GUID: j-B_qmdUKElxWfdc5ilcFgKDE8U6pFIa
X-Proofpoint-ORIG-GUID: j-B_qmdUKElxWfdc5ilcFgKDE8U6pFIa
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b003fd4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4VXmX0JWTMGhj3x2HrsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200050


On Fri, 13 Nov 2026 17:11:27 +0100, Bartosz Golaszewski wrote:
> In msm_config_group_get(), querying the PIN_CONFIG_BIAS_PULL_UP parameter
> on non-I2C pins incorrectly reports a strong I2C pull-up bias when the
> hardware is configured as PULL_UP or PULL_DOWN. For non-i2c pins,
> g->i2c_pull_bit is 0 and the condition is always true because BIT(0) is
> 1.
> 
> Check if the pull bit is non-zero before comparing it against arg and
> match exactly what's written in msm_config_group_set().
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: fix incorrect pull-up reporting
      https://git.kernel.org/brgl/c/590058e6f640a79ea0ad114cd4213a4e4df27d07

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
