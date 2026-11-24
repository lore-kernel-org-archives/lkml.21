Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486865;
	b=D9T/oXE3sjwyK2wH8+fUcLRNzlRbz4GGKkYqez2djg9gqLABjmUbE3OdHQ898nAAImsB
	 AtXVt/0ZiZr3oEc4oPCFr3T+88Xm+O2q2ESY79jVQvR0JWGcrpfWXTFw/CNJclcwl9VzK
	 dcvwSkdj1Lv/8CT/mJbFwOtwF9ogK+m9+fh1h6CW5c0374nX/OEZBd3+FcErnIYX8PDeA
	 tiXeqS9phx/u8YIcdQM1NPBpn8Ab4WAN7hjsyltqRT0NxTNZ/h5frDBKT4+FlS6BWp0dn
	 YxaQWO8putF5IanQTq0thKed8RalV8GITQDA8ogZQduhwrYzbKYOfHePDmUtt2sMbtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=;
	b=OLF8aUEBnR2RkiyDkhNoaeNgMlWemJZSVIJEoJZT+g6Hiwxiz+5eMpWN8Dp7HOBiWjmJ
	 ABwXKe4hXv7sO7YywUA3YTo/ZpnbttmNUra3s75C7lw0Get2/I1CBQC/SUWtUo54SXa4a
	 TKlp/NXw3bOx9V5Gx459gWBRBFacp2IdcIB1zyYRvADkKo/6Fg2e8plqu9HjZgbCs94bP
	 Xd8UT8QadCppcy5zX8C7YnWv5uS+y4zOA2poHhuDTiXZ58yZi7DZM9dmha/YK0RfaBRst
	 EZJ8fDzb0R6ZnA9yInRWA+cyDXxE8IbzriFXQ7g1NNIsoEm5zqWU0hx8q4NQZcTDYvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqOzEJEw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHGFiNH7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB09606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EB09606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZqOzEJEw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eHGFiNH7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANMNwlF2663000
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:21:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=; b=ZqOzEJEwo6kapjqi
	AVW89+o23xhNlELq9poapFtqYDVYcD2CCnNPFxWBu+EeP9VpG1E52NMbifwnv9bC
	38kJOzoyn8GZ/C67jEpusKMmNHRel2QddAo1mWf4LHTmgYRdXC3Lrs6+b1IZW5nj
	rT02N1Ksq3EWle/S0IoBQVmU2zuXW8kmgigFBfoKHV74m8+mgpYlQNqnBrmZ40lR
	cwS8sDr68oispp6k1FctqnV8JWFCV89RkgDGaLYTPw3F8NjDnGtyk2N4m9yiQBIu
	r9ehwimOfVViUSPQJci6mgxEHVy+GfL9fXMABPC4bYNOD1A/T3GzTDu1jwuQRo87
	6E2dYA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f0nf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:21:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc73895c7d5so3797803a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795486864; x=1796091664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=;
        b=eHGFiNH7W4sHmvcHs/5hI0D3Bs7m3sKmixeAkRgn2rv5fkZ8dQMLObqgNSdAXlnrfH
         7Dnq3iJrrdfsC+FnP0PfUNPNlMRKPZn2y++mmKk2aX8Xy4bvOTafZeO6xKpA84OWT+fl
         UBEdNi0CBvsVJKXrvFOqyu2LPr7a1ZIkmZdIZbTHPjTT5HneCCwukeVYXwacRGzFxJy0
         ta+VV+8enNOFKMHzjtmh0Zl6jb54KyQ4A+1yjYNP9OgutzWrts77OdV+aaT1DNgJyW0v
         nCc4vYRkYogXX/LEPVCn/ZeDuBwoxB6UFjKg/7K9YkT/UCuyf7APkjDoMIyqzmj8LkKl
         ZweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486864; x=1796091664;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BovgYKab3V/gWJJsa0IQiwyt6hlkQqYVpo/GYoRNeTw=;
        b=rGKYR3XCK/DAOKyBwv7kGxHsspvpoby1vELOjOej/HtLgAukSbXGKuXh1zirssTk4Y
         9Nf+1r7Wei6+GH0MoGJtDtthDgWm4ecMf0eJpGpcnZyTXEAl9ZEOiXhgZtc9uEf2oa+A
         Io+Fko0lf48wH3NQQrkhaicj/U38RMNJ36VXYzDfzkfAzw9PL21ZGnpbx1ZgFeCfkI+l
         UkD7GFU+RzHb/SOyL9OFmQqZuWvPSPgRtNvmw7Eb3DH1kQJ6vAlVCH2zlsRu7LxUVYn+
         Ot2MNuY8+Eiw16hetWozpX3Sagyx3LYsnYPeLawNgMfPffaU5F2AeR8KorK6IoDFopVN
         hXag==
X-Forwarded-Encrypted: i=1; AL+hErGRRc5j6p8ksGJKJY2fC6wezF6SgsJ/0FISTQxE72daV3zL3RyDBv51kATkzj3RsETa6OH3t8FaA29J5Ug=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IX3M4NzisH64PI2l8Q1uGQWe9/2UQVlQQxOc+4s+ZmI5R7b21
	eUEQphYAp7vv4h7LM3FD1xSd2KFsfOKJBp2JtwwJIxClv7hZrD2Q73VdXWKR77OmyyoXCwPae2e
	31KLHwwUAWZAP8PmDvhejr1mYbvq8VrqE+YzqiP6nM4Lqe3OOAXvuEstoXgknQQjf590=
X-Gm-Gg: AZFdTZevlM/7xRWDOKEWK6FiYZafDuA+CEbk1FFDz4w/7q2UPtdYoNuwdX6HBoBwuh5
	saQcswNZJIOBGrcY2BJnz0l1L3dR45QSqf7Sa0QyVoRClrPgROSgwHky8oECm99GUnUwZvgOumF
	45G+BdEtKfrlUi+pRXmahjKRJTMoeXT8eET3Qf9zy4hYoKx8ipC0n8DgiRCIQI2bPcnp95Sva/W
	7J44bjk89Ctaz0r4FN7eK6NAAc92IjWif/HfBQfWQmbv1MyCF8zZum1Q+GMbzuuvkiiJ/KeDzPZ
	IbUlYxZRErzo2gli8j6fPAapw6RnsWdpgxnE/i0B7gWse2h2KNuWhU/XhIyylTrQR7icSPvu68P
	/rO+NV3PlVKG1kHqwGsiQQ0o3rUMWtNWX23/O9Ds/Yo19cH/7EXp04L7QplCPVPjvYg36i/zXH2
	Gbgq3zyCbXrg9Doj+YUW3jxXhTqNGu9JWwKH3iZ3YZAa5ztQE=
X-Received: by 2002:a05:6a20:e614:b0:3e2:a849:64bc with SMTP id adf61e73a8af0-4014a271f0cmr12867053637.9.1795486863658;
        Mon, 23 Nov 2026 18:21:03 -0800 (PST)
X-Received: by 2002:a05:6a20:e614:b0:3e2:a849:64bc with SMTP id adf61e73a8af0-4014a271f0cmr12867032637.9.1795486863257;
        Mon, 23 Nov 2026 18:21:03 -0800 (PST)
Received: from [10.133.33.133] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285c89dsm6298892b3a.13.2026.11.23.18.21.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 18:21:02 -0800 (PST)
Message-ID: <a9863854-187c-43f1-b7c8-580938dc7253@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 10:20:59 +0800
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: hold txmgmt_idr_lock while freeing
 pending mgmt frames
To: Changyul Lee <lcy8047@gmail.com>, Jeff Johnson <jjohnson@kernel.org>
Cc: Sriram R <sriram.ramachandran@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Praneesh P <praneesh.p@oss.qualcomm.com>,
        Jiale Yao <yaojiale02@163.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
References: <20261116021037.538128-1-lcy8047@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261116021037.538128-1-lcy8047@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAwOSBTYWx0ZWRfX4C902vUPr9/K
 GaCjqt/9OekctvxclZVhW0+3WCLazBUqn0wVvfNY+Rocl2jTHyCtobka+V3F5qtAf4Cj9R+lmPd
 jBFg5X7UA/TWnGYOGTFqvxu1GuQAX7k=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b04f490 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=4O2SGWbk0Q8A1cZKks4A:9 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: mLfbAxHEino-Wgucmb20x6AHDJdNrhQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAwOSBTYWx0ZWRfX3b7vhocyPsP8
 sIqPw776ub0ujIXEuf/9478joCfTyCQwIwdspvp1VzQn7fQTDBOZEQV31NNbH5O4YShRQ07WLL6
 ZilsCKsEJW6RQrUTqAFGn50/vrvXDrvF5OMwr65A/NaqVLWh5z2G6zx/LTR3FYSB2uWv4Z5ij0y
 YhFiRuJS++cdOTNn2zFzcHfOweJH08ZcuWQ7+bY1QIFv/vM39nMx8kZ3gDs+WVUbVCjuwdP5Wk0
 Ekfp3mIM80/yu00e+zF5i67GNyEdL0Dptb7R6qwq/0KoDeGl63Koi/R7QvTeO5ii8S1plDD+wKC
 L25MdEwTkkasu14ebsBvTgryrq0ouiyDMBqKH/VFrpGSwVjXzL0j6AnEDK7vvz8nusAU6kPzywY
 gl9jjSZBr50XQsNPE5ZUXN3R990RVG366x4lf5ueW5zJiPWY5CahjXnn087gfTKZggV7TQdZWrL
 FthFKtWL6QBWICwa8Rw==
X-Proofpoint-ORIG-GUID: mLfbAxHEino-Wgucmb20x6AHDJdNrhQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240009



On 11/16/2026 10:10 AM, Changyul Lee wrote:
> ath12k_mac_vif_txmgmt_cleanup() and ath12k_mac_tx_mgmt_pending_free()
> walk ar->txmgmt_idr without txmgmt_idr_lock. A WMI management TX
> completion can meanwhile remove an entry and pass its skb to mac80211,
> which frees it. ath12k_mac_vif_txmgmt_cleanup() then reads skb_cb->vif
> from the freed skb, and both walks can read an IDR node that was freed
> after an RCU grace period.
> 
> Hold txmgmt_idr_lock over both walks and make ath12k_mac_tx_mgmt_free()
> expect it to be held.
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Suggested-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

