Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795178456;
	b=fGunsP6zPQsn+RBb66UAdIt3+79TmUFk3C+l/nV+riiJFTzo9H06H8rTOP1DVilwJLN/
	 kDRH4Rkh6kcXyxEVf5dT2LvSnGMRyJJQbSZdUN+QAv8anMMlGskbd5RhIzvkNT8dqmwiS
	 X8LTd0517Rge8bR2lUXPFcXXUWMnpifMt31LB36A/diuQdga6lKCLt4DpwkKXFEGsao3W
	 ONjfTKibGI4LyEtztkEKdc3Dy27NEFUqX8ec8tLbFvfyXs/jcggtIXpbWxjHbGPyuk4RE
	 a1/j4zLstMFzqZke7u5Z7wD8ejoGqd9ZrjzuuBXwqUGADEI6tx1LCWAjFZ/L4PYuS0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795178456;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=;
	b=yeJ+KesFKc/ezpRgMOxvpbOQan09NNS3cPoc5Cn3kyAK+K/udzVVk/MdyAwYRzMzQ8/X
	 kUCfgZsfq88bwaKg94GQQf4uGJn33W2fnhkRTD/L2uTHhOu82wdA1YnGW2R/Kqvn0b1f1
	 TFaAEofj31If7lbXmb0MHTqySADEnsR1roIyZalgr4nCVJCa8dB1QXlUpBOeo3p0KI7l0
	 YaaKF77gmOfpsYMCOIef9gSP3MHN3uF9tZH2lhObEAxW+CjYEKvqijY7USRnbKLRfq8ic
	 uy7/Sit7St4XQ/8IZS7umHtH6gXsT67wA8o7DeATUAHo7oEkg0t9CfEstUhhs4jHtrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3LWWR8c;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQOW1BeR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D943E60A2617
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D943E60A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F3LWWR8c;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cQOW1BeR
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjoWp1462889
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=; b=F3LWWR8cu3PlTHc7
	BfuLKFWULnraZ+j+RnzaIxbEMXWguU6M5pZ7p6Gujwg2lMz4cQJ+iPRfILoBaZ14
	F8Ps89wxZC3877ad5we5IR1CqLG5u+ofVvh8JaJKCsyKrAPQo1VEdDO72eZODq7A
	IRqRtNI+d+w6M/tY8RjgBSgUTGFIrfFqpJg54XQmL9VVL1wekFgdY4rQgtBZp9x5
	akB53RPNEb+4uyMubB7e2H+SyveVewXkd2KeHG+YhCQlwt4o3F4rklG3QQ9+ylhk
	dZeM5u4EzgPfo0ua9ts95sF/KHN6vjFwMgI0mZj7ajzV0IUvDD+ytiyYWr8iC69V
	5QfGDw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2guahhvp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 12:40:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9212335e257so20996146d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 04:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795178453; x=1795783253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=;
        b=cQOW1BeRVDBHZIZOq60fQfgl3aOx374Tb/gAZC4y7sOgA2q9R7RCGMJM6cE+UbHUPb
         5ylKMiP9g7JRcYlNqCGx8a5ev/+Ua0UMxRilI6nUJQAC8jtU2zB+3jIVvP3gd+VtPK7t
         y+bu47GYgy5Uarz/7sSDu7p0WM7StXj9CUQjHODDeBGqduBCIUqw897XoD3kyzOlsKqe
         s887tqfv/Oh4pB/INPSMOcMOg8Kc2DH+dp1vjgaADL7zK0INBsXPjhgRjTZnvkrMR7yY
         QkiXdi+wcU9k47jfS0DSlNTiMPv+7G7iLQaaKdegvR8lcntF4kmC7avsY0tH5oDeC6Kd
         QOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795178453; x=1795783253;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yjnNm8i9GLqLKpkwn2Wyin8sUF/yJTYucbRHBOaf4lg=;
        b=b6sfMNQ6ClpI36q2yv+fUxcAEz01EtNckzb9DQ+Vwpt7iOjz7drDqI2F7MdMo+8wLR
         +u/46vqpuxkA8LAdOo6d9JsTtrdNkdna3ZWpXUk2+lnHm9CwpoBAzIk3+hF3mlHWGqzK
         f3ZCd6QmCl/S28/vg6o0Br23VUtMrXMdacGve8qY4DV7IW09NbngRlx7BO0uKiUCRB5d
         m8OmBb62zglERVPgo9/HsTTCoFm3ZMHrjVB9xu2NEVleJttMIQy2VG+lfzkb0SuLsqax
         vRnGLtHN0keVyVvOw92aRqNCdaHytA64sXeGpp7jrg+f46KFHvXNRlERnRyjWj5xUOhr
         hUJQ==
X-Forwarded-Encrypted: i=1; AL+hErGTC887QDPcrVya1RzoZT8gVRI8ZnJmSDM6I8xVQicediSWMGAdSKNoGHnRmMf3MYO0JxKKnOAD30AQN2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QdKekoRo1n++X2MA8yRto381FaXI9iNCOMw0HkaaombIAVz3j
	2Pc4TKjz3/W1zB9J6Iwc8KTjZLxIck+Wo2eQ5iWcYPg5bUA7CjfakPclBlBpVEXE83VT0KXviNS
	hRaSPbBVmXnqWgR71IGEMDbT4jW5YGiDn8r+MGQAYn5uvGOYmC1cc9H4sORGZJuUlePc=
X-Gm-Gg: AYBFou394xHVbx7PwkMJQjNw/peTOWMXUwbIS4OOOgJBEfnmXpN4mAku4vrdkP/ls7o
	nkJQAhWzCsMelfDKy1XLNbHHn30803Lpofy+SqeeCoXG1UWc567pw3JRpn4FHYzSwGvuVdmEdGM
	6u3hJ0lJw5ijnKxQg4hNcAWNJciiiuTp66tjiEbPPbDEvge0Nkv+HF3k+nBoB1i1zwkBDghF7s9
	htEeMHx6xnXun++M0e6LIkRESUp/lEu6MI+/S0YNy/ihoZh07/D8E3rtWAsLUj0qVJEsS7Ypd42
	x0fiXpcObxPR6j2zpE+qPmTqFEbTySj60+gOM0f6jGTG8q1A4ro+37FJiCadfbbBSY10nL5q6S9
	eLvdwIock2Feyaj6n68fO5MB52zo3R1tdZvP7G1qnUW6PQ4HzMTWpybTiwnuZqZujAjbXk3/CX9
	0=
X-Received: by 2002:a05:620a:444f:b0:947:8344:17a7 with SMTP id af79cd13be357-949ba827c5fmr440600585a.11.1795178453110;
        Fri, 20 Nov 2026 04:40:53 -0800 (PST)
X-Received: by 2002:a05:620a:444f:b0:947:8344:17a7 with SMTP id af79cd13be357-949ba827c5fmr440596985a.11.1795178452661;
        Fri, 20 Nov 2026 04:40:52 -0800 (PST)
Received: from brgl-qcom.local ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm4234481f8f.35.2026.11.20.04.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 04:40:51 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        "Ivan T. Ivanov" <iivanov@mm-sol.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied
Date: Fri, 20 Nov 2026 13:40:47 +0100
Message-ID: <179517844380.14049.7516898628067992811.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110-qcom-spmi-gpio-cache-sync-v1-1-190440d0ef3e@oss.qualcomm.com>
References: <20261110-qcom-spmi-gpio-cache-sync-v1-1-190440d0ef3e@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX2u52RaZRbMlh
 Y28Lsx6k3kN6/eFW9wOmClY3RzqIuYA58AU7EkxDYK68D4zyC9DjAGgyvwcMLq0qYSIiU6uPluV
 QJhEwnoEVyx5OOD5JodEVlyEWBtBbv/sFljTTpy2hzTv/yyK3hiu2DZIXqELFsv4Al22SBGspuB
 IQu7JEvE7QotottZEn7i/pw+AglXp3vy9BF2a/aBlGyfBLdArmixW2l4GRJv/Z1GrTQ9043k9lm
 i1WBr5TGzMF/OM0Gr0LxbahhwXPI1PRKa6E3lL3LtMGQxDiW5aPj+YGUxYU9XnfLzV2mTSEgaui
 nnpDBTG8QdQr8XAgw97FW4NP1cze5GFhaXBmNaeNg5c/oEKu7jqAViVK+8Fl67Wg2sHyPcWVOG9
 /5QP+dLeh9p0yZICi0gH21HP1QKi12qauYQTEsKa5fRD4nFTDA50HpTpu7XejDv64iZD1bbx/2s
 OWjH1G5a0vJSK18b28w==
X-Proofpoint-ORIG-GUID: WetRRS-bs05Rgc8vRtHZx81D_2u0BJ9W
X-Authority-Analysis: v=2.4 cv=BIYmP1QG c=1 sm=1 tr=0 ts=6b003fd7 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HdM17cJtqKwICtWzaswA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: WetRRS-bs05Rgc8vRtHZx81D_2u0BJ9W
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1MCBTYWx0ZWRfX5gvU4bcLTiAz
 dH13ddMjyfKe/K4UUvjnk9549bNbAOw3+0eZ6fyXYEHoEXi2dRajfSIPytjiHde5hZoBy6NnfAG
 SogWCl9UkFqX1osO5k7kkC07OqiiAs4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200050


On Tue, 10 Nov 2026 16:14:19 +0100, Bartosz Golaszewski wrote:
> pmic_gpio_config_set() modifies the in-memory settings cache before
> performing any register writes. If any of the calls to pmic_gpio_write()
> fails, the modifications are never reverted and the real state diverges
> from what linux stores in memory.
> 
> Work on a local copy of the relevant pad and only modify the cache after
> all writes succeeded.
> 
> [...]

Applied, thanks!

[1/1] pinctrl: qcom: spmi-gpio: don't cache new config until we know it's applied
      https://git.kernel.org/brgl/c/21d7ff7d6531b3420727539f04470ddae499592b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
