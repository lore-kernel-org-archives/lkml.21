Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795603714;
	b=ze/uWlaqh1KCef62b94wwn86Ifjoz0aunptNDoqbDvxxm8vGyg6wAxo5L2ftjUJ/cwBZ
	 hExdfxuOoDY9MgNNUuZBTF3ixwdKqb07w1OGeR1z8eBUr0PtzRWBtuOF3R/bDEVO8yvjp
	 k6s1X0lhCFfcIABPJW+g4r37n6xCSY/nHKZfghrvOAUDg+RlR1evAMqyFGi3hyHIinJKo
	 sgLDAh9Y0iY09dY7xdoOpc5Hx+3qjfe9RCyy/6dM/jFlGVL0mNpSoIUm8Y4paKV9hC4AE
	 SKY5cfwKZ+TG52mFhiwBDZJpxClqEIPf+WVCOw56l1c9gMkIIClXgsxPvgd//x5rfPQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=;
	b=qxwf27sTQM9q1ekFr3krLukepPB1W/BCrpwPya62fVF9XPF4XnVliJht51wWDDexQ+c3
	 akey+Lnvm0GAj+YNY9Dm82rSEr/ZwlKxCemJuDjTVAv7DSauWTTf5F8laFm6Ym7RCh8Dd
	 E4WFRjDHfgQkTGhFC8lpi20Cpdf0nu6Ccbps1zSncnS7HmNaf8JGFzFuPhHlIZGTgdn2X
	 ysdkMwJFq32HWhN5eh6J4e+o7TY1fMq7HZLk3cIVvdaDpmBtFJUVMHHwmOmNECzNrbe/2
	 8DrIZO89oDAUcqoqv7AB5R0XJoS4e1jzA1B9siUFBG6wyKZqVnZ9feraYSBJo++Ptqw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbzNvsM0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFpkcarE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF856606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF856606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DbzNvsM0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OFpkcarE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mHCs3763959
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=; b=DbzNvsM0LvusNF6l
	QvFS1/spLqGnWgnLq4Ss3m2h6+l3s4S94ycHqjJQimdBHfNzvZYOx9P0j7BMuEHZ
	ejzksKnZZa8AypKqOvGHHeg8lcPe+vXZTiEsu/ZLwE1se2JMTr9HzoB6USZqykH2
	CAzWeP2PqjicEDp4J8BHyBbCiGYHdi7JtzC39SmsxaYbvbOFUN+RfV8UW3mm/XF+
	pXXHnAOTA+Y6EPAi0GjrSLf9LLmIiVag3KamNFtZIhdCbRpv3kX3xZkq1YKR3Zdk
	vCQIlG9GUyzRAiAkNiG0aWLk4ibhYz5/wZCa69x3m47k5UHg9H/D4zHIbkniOmAi
	PuKRgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2rdep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 10:48:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so869578085a.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 02:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795603712; cv=none;
        d=google.com; s=arc-20260327;
        b=KHnXAHYis5+dD6W/hYlG1dUpwFdzFA9yGVqdcnfqmchLtFf3n6tMgJZSU5pymBCfC2
         xKdbqL700x82+bMMk3hhgbu8r2MAWxjQeUkIF1lUuSKjzEjvRd7R6yGQ/gDmRMb5Xb2X
         5h3r271i5Y+Aluqdunv77Y/V8ER5Rlk3/TIs2irbn6NyVTPZoi1SuV6HoTaS7ylfUv5t
         gnS2j6Jndpxy3SuArZzFWff8PZrPOXz3qq12azpvO3Jad34pcCy1/b1QZ0pp0PhtYyLk
         PDvtkn5wdG8SVP9VJjneP0WHEK4sawtLb7EyLrmya6YWcBu5ZeCjn6Hx8231jK8A+Pj8
         zi5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=;
        fh=lpK5R5kZ8JuNeRpeucpa7McyI6L64Ka2sAldU5oh1bo=;
        b=erqdBtgtDYGuqTmtcZFv02uF9hlFB5ABIx44Cwr03UknsGQ1c4glFa4sSnLjvnwMum
         4n22UcNY7DVBknR1ic326XJ7j267l9gU8jS88Yc1SZJMWfl6y5tROKz5BhVfhybhItUA
         j8NAiIBh1NP/BqgI99DexhbijcjIuB0sLRj8R/HQBikDuKrOOD70ZmA+IT9b5hbydDQ/
         i3gOeY1cml/RAMN4EuoUyZXCX/4rmJPKzwiRfybbZDqdO7VT2+qCu035GaejPz0vq2+Q
         a2U0FYwtGJEHuAZ4dmFa/cb80V8A7agpOPFASRbnE3COzE/wQpt9ERDhhl6WZWc9TGux
         YbFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603712; x=1796208512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=;
        b=OFpkcarEGjGrej1uySxOQHpiTLi+Sgb9PFwxhUI6+3oelAf3hZiyFENVdxElrCKJiW
         iUKZ4TUpBvI2tCVzJrQIV4yEefdHHWtc+SAGYlnbxT75zSP7ChvUUR2tOw2MEiU8EbwQ
         487/f2y+0G6ngKx0dYSlEr41CWr3QYsWPFTy/bPmjQvG53fpX2bJnvi0xhXNCk+zLOr2
         0AJHJ4on3LQaPJRg/7FeeTe5PPLKunSPlMcw2rWog2s4lIzJIDDCbNsl846r0ODa9JLg
         o3NQPpIjeI7B+auBWxhxoy5PIPV5l351I4Q3+Uz9zIrO60kkCCDRqi3A7zem6Ux6n1v0
         EVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603712; x=1796208512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o6PzOb9P2But+Hib1lbIe56slQsL0ICH0XopSwOlC5U=;
        b=HCTWXeWlYDTt8aMEF5cvS1hvrURL+tyskzN1gIzInRsv0vzFnvaFpnro31xBoovbTL
         rI1mrfkViCNPBW5K/zx2GgDNw1x5/w9t9Zz3bqYnv0GxjtNjUXcazOy2HsEE6wSTrbxj
         wuNy/6jBxqnOOl8+yC2JBTR92L7mmQze/W3YVlcT1CWf46S2qH5oTboDwusFRf19VpC0
         shg7HuP477Ofe0KefmgJTTkLCUXscOcvb9GqwHv6Ua4nSrxNk1FBSzN6nCMt1FT2Yufo
         doqVWrrhQdlKRyIOX6F65sqdntwbBX1/Ha7fPoIF1axs5E3SZYc7dYNIJK/k9n9GKFWd
         I2CA==
X-Forwarded-Encrypted: i=1; AL+hErFMXX8GzYmI1W0j9n5RTLvWXjreOP5sC5nrgQzviTHycExi1rCVmwjQb+g4/iddC/gGvS9X2iFtNoDnc7Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TbTIjblhulI9rKfIKDNLHFOJBI8t+RSY8Pyeo5u5UKxkqGPd0
	NheNIjO+TPHLsd9ph5UuucLP2yqd96LE8TN2Eghw+IdG0Mz4ftWgnoE1BOggLrbXoFY1uW6neSp
	jQf/05UI4/ISDP453UH6Ba8OSMcBvzxP3QochBWBbcm6zAj1Qt3TqezqrdZIjC46c+dha16fkLZ
	Ea/Wd67qxdWr8yFi/VNkIRBuROk0OUkirOZEwCkgohKQ==
X-Gm-Gg: AZFdTZetGPvQSKLsVGRVhxuQ6+OkrPM2CRhuX2rreK9NfBzXh4VrbsLWSCiRY45KEap
	OFva/suBod+REOMddnapOyyUXijo54ozRsvvyaxW4z8Q0HZDtUzt2BSPERfYjCB23FiCupTK1bx
	CKRsPDOXCOa7DOy+c0E9d4dM2NEoqLg0RWtncuuhWX9uIdD+b1ZeEKmZEoPX31Nz02w9Iez1vqA
	iKWSrVknzEpZY46ripSJNNQBsMJ8jGiEGlO+VUCTW4i76ewQN6HgfcbgC84Y49c8wXr0MecaYo=
X-Received: by 2002:a05:620a:2803:b0:943:f4a1:7bb9 with SMTP id af79cd13be357-949ba9555b7mr2616941185a.18.1795603712224;
        Wed, 25 Nov 2026 02:48:32 -0800 (PST)
X-Received: by 2002:a05:620a:2803:b0:943:f4a1:7bb9 with SMTP id
 af79cd13be357-949ba9555b7mr2616938185a.18.1795603711712; Wed, 25 Nov 2026
 02:48:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-recovery-v4-v4-0-53d6a04490e0@oss.qualcomm.com> <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
In-Reply-To: <20261120-recovery-v4-v4-8-53d6a04490e0@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:48:20 +0100
X-Gm-Features: Aa3M54odefbRxi0PaiCQAzNWQ-0JR92gAABK5WdL3_Jpsmn2PFUYlb6w5-3lwyY
Message-ID: <CAFEp6-0ONdrwu4ofxz40AHJ=GRhFRedT3AbZvaum2M8FUi1cPQ@mail.gmail.com>
Subject: Re: [PATCH ath-next v4 08/10] wifi: ath10k: trigger recovery on
 corrupted HTC bundle lookahead
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXy2NZZY5/Yxhh
 HFgk0NZwobT/RR47b30uQgARTej5EiPQVFu2Yzvrz4RhtqANRvIzaqNX1r5T13ouDdqdIfYaR5G
 8kKCxLokGYyf1QW7oTzxtddvXdL2IhU=
X-Proofpoint-GUID: uZCPADy2qaRa7er_Ta059z4M2Hkjhziz
X-Proofpoint-ORIG-GUID: uZCPADy2qaRa7er_Ta059z4M2Hkjhziz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXz7hGBC895LE9
 3BSgJf8U5ofDN8lXJtVYkoESZsY/ggImV6MevMN9SnxxzSLF6+EcbgjL8eyRqO9kPmZtjoy1Spp
 0Q9nk0iEwlrVhwj/IQYKmZzGt2c68b7fjQWM9WPjI7LPkUJ9CeOW4lgLE7aa3vEuabX2+PcG2By
 P2YT3AVQH8ijRGNUKmFjMtPLr1SBpyaYVrvnp9ws6rpt/CBqdj5laCB+sPXZoMhb/ckuE/EzJ3Z
 qrjkYpcLaP0v7OQRbopf8GhVrdcthvBTTmn4yRFut5qZqk11ctyZrBzSF9XYKM5+bqYjT+5W9+H
 lKCGQHZ1evaqTadPZliR9lMlAuYihVS3IlY1lXrdoVIz6jBDPGZCNJat5pkpzAzIEN+hHtdFvOP
 Y18K3yRp3nl6KGiQ8GCoE7NJ2UB0wRQEwqLOXXgqvBDTKS5FRMYmNfHU/ZdO8Hd8egOm7k8WtTu
 o+LbpGxv/NwZ5XA2FmQ==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06bd00 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=8v4nwiihW6ynDyRW_tkA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250042

On Fri, Nov 20, 2026 at 9:43=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm.c=
om> wrote:
>
> When firmware crashes, the SDIO interrupt handler may read a
> corrupted RX lookahead whose header reports more messages than
> ar->htc.max_msgs_per_htc_bundle. The driver then prints errors such
> as:
>
>   HTC bundle length 2322 exceeds maximum 32
>   failed to allocate a bundle: -12
>   failed to get pending recv messages: -12
>   failed to process pending SDIO interrupts: -12
>
> The handler returns -ENOMEM without consuming the mailbox lookahead
> or checking the firmware-crash CPU interrupt. The SDIO interrupt
> therefore remains asserted and ath10k_sdio_irq_handler() repeatedly
> processes the same invalid lookahead.
>
> Stress-test logs show that this interrupt storm can continue for
> 15 to 20 seconds before the firmware watchdog allows the crash
> interrupt to be observed and recovery to start. RX remains stalled
> and user traffic times out during this interval.
>
> ath10k_sdio_mbox_rx_alloc() already triggers recovery when the
> lookahead payload length exceeds ATH10K_HTC_MBOX_MAX_PAYLOAD_LENGTH.
> A bundle count above max_msgs_per_htc_bundle is the same class of
> corrupted lookahead.
>
> Start recovery as soon as the invalid bundle count is detected so the
> HIF is reinitialized instead of waiting for the firmware watchdog.
> ath10k_core_start_recovery() does nothing when a recovery is already
> pending, which would leave the interrupt storm running, so also mask
> the target interrupts.
>
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00288-QCARMSWPZ-1
> Tested-on: QCA6174 hw3.2 SDIO WLAN.RMH.4.4.1-00189
>
> Signed-off-by: Kang Yang <kang.yang@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/sdio.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireles=
s/ath/ath10k/sdio.c
> index 748ba6749339..fdf19ce4b55b 100644
> --- a/drivers/net/wireless/ath/ath10k/sdio.c
> +++ b/drivers/net/wireless/ath/ath10k/sdio.c
> @@ -497,6 +497,8 @@ static int ath10k_sdio_mbox_rx_process_packets(struct=
 ath10k *ar,
>         return ret;
>  }
>
> +static int ath10k_sdio_disable_intrs(struct ath10k *ar);
> +
>  static int ath10k_sdio_mbox_alloc_bundle(struct ath10k *ar,
>                                          struct ath10k_sdio_rx_data *rx_p=
kts,
>                                          struct ath10k_htc_hdr *htc_hdr,
> @@ -513,6 +515,11 @@ static int ath10k_sdio_mbox_alloc_bundle(struct ath1=
0k *ar,
>                             "HTC bundle length %u exceeds maximum %u\n",
>                             le16_to_cpu(htc_hdr->len),
>                             max_msgs);
> +               ath10k_core_start_recovery(ar);
> +               /* Recovery is a no-op if already pending, so also mask t=
he
> +                * target interrupts to stop the IRQ storm.
> +                */

Drop the generated/verbose comment above or simply say: "Prevent IRQ storm.=
"

> +               ath10k_sdio_disable_intrs(ar);
>                 return -ENOMEM;
>         }
>
>
> --
> 2.34.1
>
