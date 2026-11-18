Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794992042;
	b=CViY2w6zMRcOX3mQ2hLFTwjSlrWDhGKHdV3/FuO+m3VlnKSiOE4X5jkoAu50BSHgdkEy
	 PB/9YdkFe7shZvat6Jh/XQE27Ulz/XtJxyyJVJPGg/Cxb2JNRn/ts4ihYajof689l2sco
	 29UAARTCQiRiWdPhX8rBAAVyAPZiqKW57vkKNn9LhkqmasZfNLT39NwOXQIRJWWSvGEoj
	 zxNw4dJgCVQljVLCDsj4Vg8DF9X6C2ldHhuSOuXGeQvZbZU1zUek4Z9WegcJCCu1bmjHD
	 giNX8/veot+lLhU2dQ8VUrfaInxEP9dl91kpusAafX799nLgQ04TqdRXcS5eOow5Ddw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794992042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=;
	b=Ql9ZONmbOjIln29ktKqmPBeID2nRPc84x0Kc8GKhyuLw+0HsBrH7RFKHKpaJecrvHYbv
	 lQixUQllOL0mOMjBRRKuIzKtD+jFIo6vWwaTL/9Ti8VDLy4LbtguvsxSpwjiIX4doArVc
	 GyA2W2L1He0v/sJImEzTOotjJ4NjjqI9Dt0pJSqwwg8tt/YgPNQWoC75YFDlqJmPBwwSt
	 JxgP1GK9SYEdLQRnNubUfZdI6hwsWimhFsw7Jws6QmZMymzh1nIX3v4p2mdDX9LaOei08
	 TDAAmEkyf/oIWOZDdlY5KeFXWUeOBytbGqkailsAPb5BzZqtfVTLL41t7gcYdR1+M3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpY24obQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dTreIJw8;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06751606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:54:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06751606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KpY24obQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dTreIJw8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8U6IO2106361
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:54:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=; b=KpY24obQq/1+/Jxl
	ErqTRoLkxNX6/ACBygckixxTMptbDZpaP4p7BxVTwBl8XNfq0i33iIUpDCfhqLjd
	7O9Fmc/rvXN8BVKSyFE/lQS89yhCIUfLFv9GXPljM+sNN0hj92U4DNmoRvXpSKxb
	PBRRC5FK0rZwKv1BJ/R3oDqQRNOPQfgz2OWe3UVQSNcv8ogGUZ2ogu6dlp8scUgf
	OLWRABD02vCfr9kExjaQYbb9BaBusmnwrdJolVwtVpjsfh/SyR0Bl7IYLno77vV/
	ULB1tFZKbNBlWoW2uaOk4/7LbPVEniqSZIr1Ti8QQvBmUltwLgxTkzrdIMdhqxZ4
	1eJntQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8t3y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:54:00 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so183547485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 00:54:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794992040; cv=none;
        d=google.com; s=arc-20260327;
        b=EQzvdNNXy2wz59D0jiC80S6OIdrn/Wre2Hm1aZEm3oxXI3F2ojwj4jM1p758ZzXrWO
         fuqGgEIvyWek3nCajJwpihdvZIxPp/5fJPnVubM9UUMCtzY6tE5Wn41DQtrwffFXoG11
         CLMYmVMKZm2FfpUZDx7XuBwKs5SSKyeFD220WOLlC4NDJ9Cu87zd2hIK4KL/wF0shdFj
         KXlvA9QAiyvuyWyrw/ttfYR2Sf5/Nqq7vozWSQeh7uw40rwfOgeZXcr/Cy2vYemezEdy
         hTAqmdtQs4mltY0UPcElkZV+Q1FXjEke/zz2hkr/2YukzHUWEBavYGJuy8y5S4p0VDq+
         jnHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=;
        fh=Gqo9/JdbX4tfjY/YO2J3X8Qf3R21+TLcXSocqZb5+dA=;
        b=QdLUugfKwa1J+lUdM6HkQDWnC2VCSBDLW/dzQKhMqVrVUUod54Zdio0SVWiGSCTMOB
         zTpLCldykuNFWS4bym8U+DDYi5V0mSxIFUcGeInuuOAMJnvOmHL3zEb6yuPdpffnDQm5
         yh3aBBc8aXZ+A6gaXr29+5YpvTjLeP4HCc4NgZDJWTR7RO0twW0k+fzd7DmcxrfQRMOt
         /o+Mu51Dd4PqG+ni1QoJjfLdOs0QOM5tIkHPhJdtCkIPlUafdyl7koEUnPkPqwKwHyaz
         RCNKUmh7Z8qaO0++7tOIBaQASGYefMz3yVnbHm/VBmb5AG2xaDa4I41nX0MEiECY1x+z
         2l7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794992040; x=1795596840; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=;
        b=dTreIJw8S8ykqG0OmD+nsQEfh9ScwI6ONA3XLwihzR0SNM4tznsJ9EOB+F6mMrekS+
         Szgb7UP80Qf7Cr3f/cA3bIOZUuBaBTPBGPeA7pgsVwnbVY+igLa/tnP+QKdVInK9Faik
         kT5BgxhSIPlxGiDxPDbd8wCrNhyy5EbfldVIi5IyU3S/vf0lFugskBQhiWBSjym2M02D
         Jo71oULjzYwUtvmZner+zv/SivLQlOzkHxSv3WvC9ZM1lk9sUabsZ0z02VK6C7TxcuWY
         XORZ9+5wHuXpqpZNfrkzJrN1AJ0PgNfycevLvIpE9evTur4fC82VU5aQGxae7MybVv2m
         8D5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794992040; x=1795596840;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=letKmOg1sMGOEnWR6Ub6ZHNwMqgbIVFnL3jsf5K5z7k=;
        b=oN/7yPgmfG6PFjwWgxaZySoQwIKvOL0dMt7K6JbBqeZTVen1epK3OD+XeTau5t71r4
         3tBjna+PCb1MTjBMwYhU8VzgLCeBLFYKtxVktPfqoBUAC2KaSblH9PAFeppOVp2p6WVx
         YEkbQgV9qL2n20bodGQ139FU6SxB6X62JU3QlSSa6Au9YmIpH/6cTGsB2g4bn8djmLNg
         Xwlc4EgjEXF/Nr2De0pmkH5UXXB3aZm8nHUjy6z8DznMVMVCZEhR8eMZB5O8d7bEeb8w
         5KCh4NeIRYbzlV4kY4c0m6NLSnSlhhVDHkXNQ28IQH1ixZHI1FCLL2T1leeeiHS14aLv
         C1Pw==
X-Forwarded-Encrypted: i=1; AL+hErEx1ABTwdXSZ8IOGemtDRfUdcSoR1Ui/rY6RnbIgvigAnPb9YT30Hxkxp7mT4MUIYCKIlEdQNbw8tTiscE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/XNIp57ovhm4xiNgpSDZX9eLzIclltbFVhotceeQEKod1iRuHR
	xUSXykNZhVe+nWO2fwVqwszP5IqjcBMpmFbHm3KWIjYsHedAvCXKa814bVL9adTClb6gp61KOO5
	Gmyu6vu5rwhH9l5RQzKJ6wVTsSFUkk6NII8z5ObY9dBgGkP9HmhmPPshQ7qeBGQN+8jyMnWcXKi
	VhqtPCSo4u0/wk2GeOquFGJxKlKvzBJFTICYVhc7PmE2DpdY0Wfg0dYK8=
X-Gm-Gg: AYBFou2yoKNn/Z/gAkM0BaY+LSrbXI7fPJsmgxNJmquxqKY6fG9Gq4Hea+UBbNxxmws
	WuFjx1QslyuM520Qe5538YpwpWy2oB191PrWZm96kULDreY9ZqerrOSsdhPft9jlhaAhIe5qFi/
	MAv8Q8cRme4XrpBlVcdDb9JBj/rlCSVKj3lr5ZNpsDHyMq3NjhRgeKrT6CXE6HME41NHf1UreBp
	pA21oUH8iCVLf+seBXXTareTe9KUuwVgDbi3w4n5ReBM631X53Wedevjv3Kg9ltXOhg++24BOOX
X-Received: by 2002:a05:620a:260b:b0:949:6574:f36a with SMTP id af79cd13be357-949995b3c61mr358672185a.38.1794992039988;
        Wed, 18 Nov 2026 00:53:59 -0800 (PST)
X-Received: by 2002:a05:620a:260b:b0:949:6574:f36a with SMTP id
 af79cd13be357-949995b3c61mr358669885a.38.1794992039459; Wed, 18 Nov 2026
 00:53:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118052116.3901761-1-lcy8047@gmail.com>
In-Reply-To: <20261118052116.3901761-1-lcy8047@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 09:53:48 +0100
X-Gm-Features: AclHuK8sONdAXHDBXSHnReUAAHAsZCMvEJNaHxHQtWOAW5ELRw1-8RjKZhSzGYQ
Message-ID: <CAFEp6-1h0iwXtPr0HXVMceSDdQ09KPYomt58Nme_AzXy+V043Q@mail.gmail.com>
Subject: Re: [PATCH ath-next] wifi: ath10k: free msdu_id and skb reference
 when HL TX fails
To: Changyul Lee <lcy8047@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Wentao Liang <vulab@iscas.ac.cn>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: WhVkEeAPR6IAGvGT8bb8e1S1FdExNr48
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfXwG15j71YwV7H
 EdMqsqPn3rykkJuWr1q63NzcJeGtLiBy0ZoADclbFC5r6oMrGXQWopx9vV12hEWS78j3LtYOTCK
 tQ6T01lFVYmiR6NfN+kByky0ZnK3Ods=
X-Proofpoint-GUID: WhVkEeAPR6IAGvGT8bb8e1S1FdExNr48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzNSBTYWx0ZWRfX6D3xs3oCHzb6
 vKWWKlMgj4ur9Ks4+vkufBUTQb7q3qe7rqQPcy9gIhFXFFmuT7svKpi+jyDZcg6lW0lPT3Vot6Q
 JUULoP+0RqG+DFBpHbAoey/o3s0v0QQYf5egeFbspBX7T8lpvZUibNqVD5G1CdlZ6bvtemZD4RR
 nV9kqbKlFeBfsyuTe+BT3Ketwsga6X79XKZiQKBan+iPlAzs0A0HuwNkV4kBLaC+VppifNuh++o
 SFBGOfwi6yeX0byJ8c7gmk7g623BeiIMJcYZLub5yioTTEbKvRBnQVknWZacuiYK/T5mlkSUp3I
 GoODNmpy9nyocnPCl/ujgxLali7a4Fp1CS20HmxL93ueWtKk9Adk4fGWKVzPIHehL/SPEn1ftSK
 0IRZ2vgSGIzwYUQFVuX+RmlQkS3Zfr9H5Fu8Y89uh0kK6d7K7nYGA6LxoKGZRuzwS7V4EQs/j9x
 Dd1KeGF4fZJ1eialD/w==
X-Authority-Analysis: v=2.4 cv=NNVAaE6g c=1 sm=1 tr=0 ts=6afd67a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=lJo5bTS-0ZoCzmS7HdAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180035

On Wed, Nov 18, 2026 at 6:21=E2=80=AFAM Changyul Lee <lcy8047@gmail.com> wr=
ote:
>
> For SDIO and USB devices, ath10k_htt_tx_hl() allocates an msdu_id in
> htt->pending_tx and takes an extra skb reference that
> ath10k_htt_htc_tx_complete() normally drops. If ath10k_htc_send_hl()
> fails, for example because the endpoint has no TX credits and TX
> bundling is off, no completion runs and both are leaked. After
> max_num_pending_tx such failures, msdu_id allocation fails and no more
> data frames can be sent.

The above message looks too verbose and confusing for a somewhat
simple issue. Maybe this should be split properly in two fixes.

> Free the msdu_id under tx_lock, as ath10k_htt_tx_32() does on its error
> path, and drop the extra skb reference.
>
> Fixes: 8ea51e409eb0 ("ath10k: htt: support MSDU ids with SDIO")
> Fixes: 30382dd1cf3a ("ath10k: fix use-after-free on SDIO data frames")

If this is a fix you should not target 'ath-next'.
Two fixes tag looks weird, what are you fixin exactly?


> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
>
> Compile-tested only, with x86_64_defconfig plus ATH10K_SDIO, ATH10K_USB
> and W=3D1.
>
>  drivers/net/wireless/ath/ath10k/htt_tx.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/htt_tx.c b/drivers/net/wirel=
ess/ath/ath10k/htt_tx.c
> index efaea150025b..b437b09717e1 100644
> --- a/drivers/net/wireless/ath/ath10k/htt_tx.c
> +++ b/drivers/net/wireless/ath/ath10k/htt_tx.c
> @@ -1378,6 +1378,14 @@ static int ath10k_htt_tx_hl(struct ath10k_htt *htt=
, enum ath10k_hw_txrx_mode txm
>         tx_desc->peerid =3D __cpu_to_le32(HTT_INVALID_PEERID);
>
>         res =3D ath10k_htc_send_hl(&htt->ar->htc, htt->eid, msdu);
> +       if (res) {
> +               if (ar->bus_param.hl_msdu_ids) {
> +                       spin_lock_bh(&htt->tx_lock);
> +                       ath10k_htt_tx_free_msdu_id(htt, msdu_id);
> +                       spin_unlock_bh(&htt->tx_lock);
> +               }
> +               dev_kfree_skb_any(msdu);
> +       }
>
>  out:
>         return res;
>
> base-commit: 4016f6c3149e7e3faccc1654db6a3030c069383a
> --
> 2.43.0
>
