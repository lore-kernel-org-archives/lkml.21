Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795597228;
	b=Ki94FYTa6RRIjUghYlZUWOPmE5cR6KP0g00CFQqpCCMEjDkMHbD6jWIO/MyEz7LZlkDH
	 aCBXuxD9SXFywB7GcQlizxKjHgqa/2fxgllcinVTTMWrmlU4xoefpjOB1d0hknI3tjEZZ
	 gVGDXoGvKAOB8w/cZbbztya9qzJhLj/4tJLLE5j5lT7EPZd/NEgqX/3rbRO3iTZZYKxWx
	 p74rsN6JA4oMQKkGAfE+FwDPu6TaoVgoTmk6xsFAu4i69+Ql721MPnmzXTUu8DCNlIuHd
	 a71C3ZknpeK6a3CziD8mKRe/c2I6GXQVc0CZU6chhzmz2WtdLB6udYhfX53S7HAZkIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795597228;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Wl4XcZN2VOvloizF1J7rKELhRkOFUIsdEYnjwHdhjpw=;
	b=p9bVllZDeBGrY3fqHpJYrpqruuzDl0HxRaQ+RrX/89837rPxvcvybSGJzVvvNcd5+AeF
	 xID9GhUmeoeCrTofA73H4SBZhgp8oapZiuZjEVmhEOe/eK/WMUdKm7tJNJzX7ocrMmqOq
	 ID01yVTDGOsA4al/HUVo6WngMiiOIFO8NGgq+ey6JmafoCK5c4j4bqiTt+zpOaLmtOpll
	 jGdNzXLhTUKvOh65LS/GyIr2ZTz20S/2fyxlJWnd7DT/l8vQ087l/A2R2NotA+KALfP5S
	 3gbrM9dZLgILFpxTeGyxjBbjfvB7dIqPXGCGRvcWQpUiVhOskunrIXwg7VyFZNdtOAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2KdVGQG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Av5MlZKp;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F72606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4F72606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2KdVGQG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Av5MlZKp
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP8vkLT4191258
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Wl4XcZN2VOvloizF1J7rKELhRkOFUIsdEYn
	jwHdhjpw=; b=Z2KdVGQGJ3ZuAORpm6w142Mqk5T+B5R+/F8Ky7u+FzBaB3ZnPfw
	TBHpjTzQ6R9GJ/FLTUK76r6N99pKERDTKeDLXxTswnNxCL6YoyfAuppVlj8lxXqf
	mrtGvTgTUsS38REMgsqGHMNPCCtDLtS/yM5OaqxANJTRUzP+dlHZX9Yo62Xdbryr
	jxyteJaj75eSUZJJg9O0yCU2OpUpTvyHWMXkiF8SOq+Wx2w2k/JrhtUu2CkgcKxC
	n7bvoLxCwgt1+EwiJzIShpk3uvJgQsI2yfx9fKUAcsWlMBH9M7fBkpMEkQ8H9tdd
	4olJnEh3hOfWaJSXOZ0QMwx9MRbOgzZOgXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5cxkbwyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:00:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fbso790989385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795597225; x=1796202025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wl4XcZN2VOvloizF1J7rKELhRkOFUIsdEYnjwHdhjpw=;
        b=Av5MlZKpYT5smuiFCPZtABKk15QjvcEznt4RnZ3gQjZkbSeMXy2qP5/ePcFCNjbsTn
         lTWYmnFKo3Gy/y8NwGHJf3mSd2vgyDNhHS5BojCM3HwYRd2zOMqzujxS1QqB6fo+NJdS
         JloTVdehriaQaqpsGqRDt+EVifCoCzDpbqFmj5amERYjWYOY/DZdWHzL0N6D778W3y/7
         n6xB5YKoAxy8iabRgBTK1He7x8/Ge+G11mAOchTxhOBNsBx9dfA7iRH329BduyIof+VX
         pcxjbCADj9Q/UZ2yXYs4yzdEaYxOUg3Kslp0bhmUkijLDzen1DTDIAF9oKuiSniOBeN8
         EP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795597225; x=1796202025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wl4XcZN2VOvloizF1J7rKELhRkOFUIsdEYnjwHdhjpw=;
        b=JoYcthwbyLNbSoBlXS7A+vswDGsrrklj9o6cd19W8YZjXkAZwEoD6l9jTa3k7Iade7
         dW7qjnomhreySuGTUr6CkqbTD5XAFRZt1BE3SE3/UxGTkhqXaXBPMBKOfG0698owFdw0
         ovMqH2yCXdv8KmSoxxyqNNUnWv4g9jk+UdMzjyc2fQlvqVV0ZU7Gj447JPtVofC2RAgD
         M+N2PnDbrqb44+Pbe4ZmrhvMz8GBe/8ot4l4Sfnx7Kpfm9GzoP+Cm+33z4VsmZCCtNJa
         Zu3vgNpFubIY72HbYui+TCUwC5ZWTDueJk0kCMMg6me36GqD9f8s4paL1ea6CkVGerpa
         3h5g==
X-Gm-Message-State: APuU4Z9Fj9K78hOjEYS9c/GdiNfbbAFLIelQiL4Yp+8OgvSWAyL0kKLX
	ejw/nxsgCQMz+n0c9qPQxzw+Tn6ttoQaNM08J+0xbtbWBRM78QI5OOdNfg11QSgiTYrSjpOemXq
	qWVl5LYMzqlZEX/YNppPxuSIuECkZDFZwXimk97BvI5fkL3hvZ4xqJFcBFt4wkWBXDZM=
X-Gm-Gg: AZFdTZdi4t7siOXtkXect+vdpN+DFKDkPyUmcpf2VGEEEmkci2CARLpbok4YzNTPiEd
	+NWLKD/yBlPXTZkb7xpqo9Q7TtAP/mBKEeyyrWFAf5NyqKdt+Z6FRlOmB+V03fNdhJ9K9ppF+nH
	d5JeNvLdwMsuXFqEjbgWGN4N00gCBUoEG/cxmd7WM43rl/OCUOzz8jEt6m4cHzkIImFyMQyHary
	TvifRuGoIGpV3vbLF38GtmHPSL9jTZsXC56owiBKtUY8BQ42gabl2TOCVguzThhec9QoSDBKQCA
	zZ9kZ9kOCz4oiM+MQpQAm+z2BAWY0yr1b951AJ1xvNpY5AE21vp9JUybUVyITQuG9ZCvCwWi9LE
	kDcl6mI/HmOjNdIbQ0bH1ANeQmq3auxu4BOUxNCIk01z+hu82WFprKiWfh+Aetw==
X-Received: by 2002:a05:620a:46a5:b0:949:3f0b:4cd5 with SMTP id af79cd13be357-949bab1631fmr3023493185a.71.1795597223768;
        Wed, 25 Nov 2026 01:00:23 -0800 (PST)
X-Received: by 2002:a05:620a:46a5:b0:949:3f0b:4cd5 with SMTP id af79cd13be357-949bab1631fmr3023481785a.71.1795597223007;
        Wed, 25 Nov 2026 01:00:23 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm30805138f8f.34.2026.11.25.01.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 01:00:22 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Michal Simek <michal.simek@amd.com>, Sven Peter <sven@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        brgl@kernel.org, Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] arm64: defconfig: Enable FUSB15201 Type-C controller driver
Date: Wed, 25 Nov 2026 10:00:17 +0100
Message-ID: <20261125090017.26981-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfX8xB1k5XNcfSm
 Gp8jy37qgMiPQL56DL37FSclN368beh15K2FI2VCPThsqmUq+jgjo7AdtePpMueFp4fbfIumBg/
 4ReqfJD5MuFS+yHquVsCc/hyi5XIW3EvGxjvb9qD6BVHvYSEFxw2zhc2Rdi+C1rICUeXZ8a97Aw
 KWzXs8AiVt8q5LXHQTti/wefDjF/c5y+lCfK45Sac7Rek5uaW200auSL/vqkgdzEdpv3BoBI91C
 Zy7/nBkJmsosDxz6BywMHhn5VF/UPBdw0OWL+eJXNIzA/WT+GLQpTs1ISBq3eTlKA/dd7KhC2Kw
 FH/Vce+Fhw1d3PRYdCFPB6LtkL/3r19qXYrH9lKy6D0nbAMekoYNaVA5f467fGY65hynXGdWUJg
 urQ6Q7TCzPvOTcG6woTPzpaTTWBURlalHKTtXrWWDrb6RrgtW6FpGdHEj3UTCm4t7xLmt84HYiw
 AznU2EjwRsj93xl9nWw==
X-Proofpoint-GUID: lY7o9eli70SKErw9gcv0glZCu_jwIBp5
X-Proofpoint-ORIG-GUID: lY7o9eli70SKErw9gcv0glZCu_jwIBp5
X-Authority-Analysis: v=2.4 cv=TLbQ2Fla c=1 sm=1 tr=0 ts=6b06a3a9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=3RVehInwFxL8co9N1jMA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNSBTYWx0ZWRfXzG9BRMEfxwxB
 cSBLG8LYrA6j5yeX7K7+rQTiFDPk8CroQL/p2BM10gcSbhke5JUSHQjbrZUYzHmbbGVBa54bsyu
 6UgtQ7fcGBzHf7fa5AzCgW6+mFb6qtM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250035

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Enable Onsemi FUSB15201 Type-C controller driver which is needed by
the Qualcomm Nord Ride SX and RRD reference design boards for USB to
work.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9c5b64f34a228..5d4bfebc796fa 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1279,6 +1279,7 @@ CONFIG_TYPEC_TCPCI=m
 CONFIG_TYPEC_RT1711H=m
 CONFIG_TYPEC_MT6360=m
 CONFIG_TYPEC_TCPCI_MAXIM=m
+CONFIG_TYPEC_FUSB15201=m
 CONFIG_TYPEC_FUSB302=m
 CONFIG_TYPEC_QCOM_PMIC=m
 CONFIG_TYPEC_UCSI=m
-- 
2.47.3

