Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795415320;
	b=liavDCaWmNQIbhDk0JTLNfGCDa6jD5FLd/qmPnWPBmp7sg0lRL9QGlDC3RyZmLTIteUD
	 EBLK9bIbilOC0gAp1ZKUKlz86nbR7lMAuQu7mQffzNOfmEMH7IHwTUKhA8EEmHh35W8tQ
	 UZldUe/yOsGEz+Wy13OC3Ts3x8SAdgXf0Be0OG4dhBfp1si9iwipG8yLYWyq5Z01xEret
	 guEGv4f01JDxojBDEggxib99/W6IpZNskGq+N440IwsOSnfxewTn4ioUAdp57b1MBRP9Z
	 /FIiykldDZSW0l4kFjTku8oa05Hlpjd7RFZ3yE7HmcTNPwTbyT4xaweqP1PW2fHOEcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795415320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
	b=EzU0MV8mhWaThnN4j/LBD3riZ0hQD772EbtGfBuXM+Mkzh4y4zS6VUIFixDE8QEvNbrE
	 uXvvi6pxlPgAogg5s8nuasjfXXZ+THh6e3WsXD4mxYTcDjB1cEmyOaRJbJ1e4se2CjKsL
	 FsnAYTLWtAtNxAoAQMtesjIEVRLd4QMlYjycSH5DN1/L9IGaAdbFq+t8TD5k5ShEPuwt6
	 Vrfm4S9RwewXJfvfA7U1joVFS71w6Yz63+gSsNSFEC5qMCfi7mzcdJ73b0vG39eQ5cECU
	 92sR2HjwBBwJecW6pk09MLtfCak3QfFwICjwuwrGWXh9hEP3fp4b4MXDoG4eo2/y8lQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOJ5iFQx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zxtl5aDS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1211A606A69F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1211A606A69F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kOJ5iFQx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zxtl5aDS
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51A283780398
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=; b=kOJ5iFQxLqGnHt5G
	VtkhBb7vWjdmQUvSoffpIXHnPnT1xZc3pChrOPDCA8IM+j68rf8y9NmiLY7PM4NX
	ye4kDncIjSYqRLJ+pnGw+3PawUnq2AwR5aTP9GN0lx1R2IrqLt8pOVLY1+omkcLM
	AUGcXEXtFYaoGuCZ5bWGOzWOBcc4cQgtZQJrrWgCikz33L1JY7k1xegUtBmyjSpz
	xU1R06AqKUTKUTAld6nsi2KGtPHyAxWtGNeebnhxTxMftVP9f8WixUJUziJLn1uB
	9HzKl324iREdwY2iP9qdL+/THh8Lp1SvsGs7O9OAQRKAy3ndFgv6qCc7coEjEcTb
	WaluRQ==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk5b02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:28:39 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4e937c5bd4fso2484793b6e.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 22:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795415318; x=1796020118; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
        b=Zxtl5aDScmU6mMpS6Oz9R9LvEdGSf5DFyyd1bf1zg0LXccdY8bya2wvtiT/+/capkQ
         ETTNDb2W15+6Yp6QJhdFtYTq12/FS1De9g5gnoZzB9eiQDLFYQ3JA3MlyeXUwRBXkoGJ
         58l6Fsx7PpGXFpDiz6ZpKaZ9pZFva71gL4xiEksoirlCtXpZqOKUZ6Rk5wqLxYWgwOdO
         Qm6ru0i/0ktlzFvbl1SoEtnj9Nlz2UglDFOYMu8Hn0p8/LbaF4F5ye/Opq5S7hOgPYWS
         SVjKeBkvZBNZNPcEDjAQgzTItXcwBeE3tsKwusDVx10A+FWHK1rJrYnERDvbjBmRfskv
         x4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795415318; x=1796020118;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DW12okt755HtwVLpnWjRB9wGxkDaJvfH8W6M6BhHEO8=;
        b=K6AkCla3MfwRhbzn6SBDvHV3A/nMhmWtdOUfL8T//EFdAXYMZxi4RSSqMvjUWlIouB
         zZhYBIj2JyzL0igh8NPzAtzYGk5kYAIY0lxXpguApETFlfyPdFe7F6R7IQe5IM8kGXlS
         UQPz5oQmqn0BBJ8eHS/IXLLi9NhgLJP/7GTr5fDd6KkylP4LSddg66RtdJfcia1svKwt
         S6uvZbHxUm+ncK5QPRcS/T71lEOKo4bHcexZ8PCs5Booo8oHvvlSaYVCzjqkuvDVB/WI
         1X7OVEicHBQsUmLggX4l81B+xm7Q50XJKQkuNnb/6XPaNaw/+nAZBRjUG73CW1zqVs4Y
         4hFg==
X-Forwarded-Encrypted: i=1; AL+hErFa/EIKfc2u+8ewl+bq0kCwCh1jmFLwCLX7irA/OFuM9BrGAnvXuIw6iMebYC5LmhD+5LpnmcYi8hddiD8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rq4lcW6vqZc95kaKHS3JXTPWPKLY2YUa/g3A+o0rP03XQdLOW
	4yeIqx3ResbNW3M5y1y4fcA/svmmqz4qHUfniPb3hs482DqdwLlYDHoOxRNf6xFVQbM9hK2eNZq
	FJaI58Awxv1gkWaM0bRn5M4CtEqXSU7Gtu14cH8H7KrdO+xXca8LVwyPdYULDLxkhLB8=
X-Gm-Gg: AZFdTZcyqNof49Je40EJyQZCFJXtcf7IJCz0TxQAHbV9A65XRsbtKQ2lUK3Qjc4ocL5
	W6lRtrSNXC5USWQMif546A25r7NEYFiq58m5ChTBjYUMJzNAS3nmjZYEk+KyMQT/s9P4QivB+Zu
	lAiM65B7wh9oHF968072P/BJx0ug9DAOg5pYOfzokhOR9ugeI0DgB6+gPEE2wZ8lLYiM8Gv/+Af
	4IgIWuCgzxDCJvTixZazFp33mgFUlWj7eqES472Opkhi62qS27WTErWUvHYAiXkIMUWz3GHcnaS
	xAgheog6SJHhTJrc1J14xb8Re993uyvxGzh5VpfLxTlPM9LHf43wsEeX5ZuhQQEkQwC0FCkS9uT
	+sVR+cd6JfErdF6HZAz31LnKEjKv7oFMHTT5y8eryJiTByr3DThUXEk+aLbc39gB0/YR+2w1w0+
	ueUJqPLR3J6ajx1Sitks/94+730w==
X-Received: by 2002:a05:6808:6413:b0:574:9463:5511 with SMTP id 5614622812f47-57a0b64e63emr10305941b6e.48.1795415318496;
        Sun, 22 Nov 2026 22:28:38 -0800 (PST)
X-Received: by 2002:a05:6808:6413:b0:574:9463:5511 with SMTP id 5614622812f47-57a0b64e63emr10305924b6e.48.1795415317985;
        Sun, 22 Nov 2026 22:28:37 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a362575fbsm8762533b6e.17.2026.11.22.22.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:28:37 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 22:28:09 -0800
Subject: [PATCH v2 3/4] leds: rgb: leds-qcom-lpg: Add mutex lock in
 lpg_pwm_get_state()
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
Message-Id: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-3-2e885f60fbeb@oss.qualcomm.com>
References: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
In-Reply-To: <20261122-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v2-0-2e885f60fbeb@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-doc@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795415311; l=812;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=E9cLjwDx5BK+zqMQtgOEwMzmeW7XdmjYZZoDgxpPWPY=;
 b=ehXU+osAStcKgvOmBX+U39c081WCbpCMsxGMgWGRC4JcPzKSYDLvwF00BsXf/XqO2HVbLJ1Ms
 Myww3XaRcV/AX9Kgqh1dmfCyAefHpUPgvwQzNxiIiL+uNoVHerQl8di
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-ORIG-GUID: jryUitcsaWOVoiBKDfzPeYtIFJIgtua9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfX8DL7Blw2th99
 dt35aSNsPJKteGRoDsltCiZp6sCCmvz8iEeebwytjKMJR++amnpE8p1+ovOyzB035Zo6p4WVwy/
 Tb/g7CdKYcDR9l/zKrKGAA1E4jSdF6kwh2q6DfAmZHBG1OE2V3f5g2mi2l951VGQKiaRbMUqrAz
 zMd4Bb9Lx2ytL8IsQw5DIwVRJu+3kQUVpSszLAs1xIK6TGJ1Eo9fSNt2C2/d2CzNl4wPZsOy47v
 jhpBEpse7BcsJ6iJxfzH68r8MszO75VMzy1FNn0Gi99fiB593QMGryi/kbRwrwRvC8Si/Dwkg+j
 Mgze7/mTiOkcCPvOHT/LE/m2Gg2JoiV6iWXDPjHufSWPn/tIY2RbAWk5X6NdzrhlYXlTj2eitRt
 9tPcxd/K8eda/WX1N/4ZBwrLXZk/FTi4bR84Qzbm/czDA1f6AzHs4tr+z27KvXh03KLlH3BoF6k
 tAyV63tN0m56Z90yLgg==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b03dd17 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_SGh9dyU8YcHfL2lJxYA:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyNSBTYWx0ZWRfX75FAd4HoZLAO
 46lVD5uRFnvPrTY6QXZFRXwTuYFaByRbMVc6MLbH2zKTi3dkB+jOglUrK80vttPIkC7oDPO4fta
 CtD6lkZfIweVprwTjl7UpLHvtJkqEGk=
X-Proofpoint-GUID: jryUitcsaWOVoiBKDfzPeYtIFJIgtua9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230025

Guard mutex lock at the top of lpg_pwm_get_state(), to make the
register read atomic against the register write in LED callbacks.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 763d6379bd2e..5d8f82ed228a 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1470,6 +1470,8 @@ static int lpg_pwm_get_state(struct pwm_chip *chip, struct pwm_device *pwm,
 	u16 pwm_value;
 	int ret;
 
+	guard(mutex)(&lpg->lock);
+
 	ret = regmap_read(lpg->map, chan->base + LPG_SIZE_CLK_REG, &val);
 	if (ret)
 		return ret;

-- 
2.43.0

