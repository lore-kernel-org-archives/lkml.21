Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795163626;
	b=mdgCo9th/cs7SWdWQJhG5tDin/910mMToXKG7PmNKJg4buhkTCfuTaWunl34gYA0GEOx
	 05r5jKziUHj6XDqhaPsdhee2VSNH/HH/NzBgoCuAsctnNWYA9CGultvzkDpvCQ0FBzMae
	 QSOoIsmYpBHiVf0eg7pRzfy81uCAd1mvN3VZHur8kAcM5nmAg1F66KPb6OfrgA9ucZHV/
	 tj6pp/zu3O3oZQbVEVt1seY+KsQ9PRShIQI1hSB+mvHUNd0TOrhBVfZnOZV2FtfHYcc23
	 Zn0pKbQYvVqcQl/gfjiNCCrpEcSthiRxwezLrY0vp+RtbwjN085kSMdzWmkw4Av5SDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
	b=DQHqFDmMug2M93Y+MI+OiUqw5CVaUOyg9741Hngt1oW7NzKKPWlVP9GEbIfS9MVP6ddD
	 +7tVrvjUAGlyIM2NvouqjYtsqGoVGyU2MSs7B2T+L/y05dZbRc7aXNvbrrCPpyQ15UZmD
	 CLpLVLbo6IrxnGhDBS58hCLuRrEzgVGiLhp+S0T0EFHTdwV67c9YLtHvxIsBuOS5sRBaC
	 teoeknCPYQl+Kc+w7HHkRjq1l3BKGdKmtxgdCxV5NBzRuFsuP19YqMpj9XsXFxZtOkca7
	 HQA21a3rLG3qYKO6LEfVUKocaI8WhQma5f4qRdecbiW/olKSD7WpCbMsCWypd7qZxWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JISZ+Ax8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3ZHQgzu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87F5606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:33:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D87F5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JISZ+Ax8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M3ZHQgzu
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7frMP2695570
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:33:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=; b=JISZ+Ax8oTuX7jaO
	v0PaB+7NbZiya6gB5uQvYINZN5FssYtBKhpEbi0BUM9KPoluq5jgWfvN9SIHp+jq
	7fLnoanD4NNLCVslmdodnWDRhq8cB6IjYHkr5B/b3cnYTcpDCRkQwK+e1PonF9Cy
	WoatW7ZS25rbBhhZzh4GY/83XpnQVcFuEIPzyQvirMZPPqh5ldxOnm32ozzP2RB/
	AFxh6t8XfrTjAxPUjy/LLN9bsvq+zVXWDphJUSaos9EQyz4VHdNQmbaz23+uMz7V
	Wch5mHjM890nPFuLdko7cg/hrKF2AIRYD+WPPBCW2WxnTgaUGRzCPPC4mH3kREAN
	4SL74A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27au2q97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 08:33:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9495dd0f07eso128510185a.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 00:33:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795163624; cv=none;
        d=google.com; s=arc-20260327;
        b=OsOwKtaNU92l7ag1Te7TPA2TdLwLlZfqVyqVVI/xJxXxZ7lkbkEiCgchxrgzFT2XVG
         wolTEOZG6NWbXQcEUPxz7CCBw4IAcQRKFyXpOZnwrKDor1Ew2Bfegfs1p6aTeH5BNxTQ
         mdIwShspXnlpcLSgx+Cl+xU3Rdq4yhfOJL9zOrl5M2vd0nqCZGeEKKrSm3ZNce+dROyj
         I2U8u77bUfa3cul4AyUVLwq0hB6xkl4z/JYKcLdK67Uq9mKTllNe726SOeFdkUahZ6PJ
         mRRgZwmT5jpfhsCCjy5CktTPrlMOMF+Xzv8p9dosKRmnIR0vzzRqPSORGo/Q1RVoPfEo
         GjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        fh=ydBaVoktqDrw7/0/S2wg22jkcixwfv0F2zzOmXbqXHk=;
        b=kn7eDFPqHpiTq/hpk8SFCgwiPi+D4PudjDR4l0+Lq2yPOo49GwglVANmTGbJoiZ2ve
         1dQnmc7DrxnqulkNieTX2rtBOUGfwozay02Nwp5SRia33/fXkKsKuy7Hsb8RGgcs8CHj
         9IvMCw5X9E3yMkKfXIjDC6YXR4Oe94TF4TLxs+2JdumvkFlJHe8I60YfXtrB+fM2EVmB
         OAJSHFNHQLqGBSFRYIabZm0v8tOQynBskVTJVPdh2BLHf62v4AciOWVfOSk+t+nrshWn
         5TrrKRqLeUxCdobG8+ET8c7fuigRbDd2Bz2yisJBb0O/3Cu8md/BoI9yEL/4xRmKvzQg
         ohnQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795163624; x=1795768424; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        b=M3ZHQgzujRMWIHTKPVbFJmTfDHRJfZvi+BVqLtasy9xzVgPMdTGmflTim46GNAlZ5D
         SZG3pXNzhKsMt3i9Ft9W7Ok4HhcgTD1MjEK8HwBCOq+iMCYdPaKyp68RCckh68+/dqdR
         +RHYzCJlYBUoW7q1sF0HX7JrMNXWNQOd3Zlaebx833I1ZxMQjwiAyj5UZdjIy3Muk6Em
         bYAHQ35SJldSf0tspS2qMtP2AQ33RABWPWv3x8H7vGBxFNM8YAMHfFWi1bq3Qb7rUTkK
         ft2SDTvkhAvQugCdS03wNKz99MYWAwXjQaIe/db6t9xxW+WxDFr5ysbtqF34RTseuyqn
         N6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163624; x=1795768424;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CO5MrNlDL6WSmNqTK5OrmHd7flCAe+glUJQ5amPNrqs=;
        b=AJBbti+xsmf+Agg9GIfnbADCwRxEuXaly7UWja2WtYxac7DLkiTSNBfxYLk4XAPA/2
         Z0Q6TP1gxqBbIVKJDzeW0n7GttAwvxGYHctqcE71LStHugKYLqU7dm+G16KSz7FQ0K4T
         lerStNkOvat5eMEBLUfynAQKvxRJv/TMnZ6rWxoPwvqd/6AAg2w1MpPruZ8Kd76DqzVe
         P5yhz1sitKe/cD1SO3cNv0UH4uZPavbOellO2dIPNV6/1KgyLcAXyjtiAa1rAAWhHf19
         Mp/yf8YzTl9XCDXia1s2NqhUIgWE1hZ/Gh3hNCHWMEoqx5YtnShhHedSvKvlzbTlg5oG
         hY+Q==
X-Forwarded-Encrypted: i=1; AL+hErGv1UIAF/Tgg4slgzM707pmPp25SzyxGIuFfstxVuLBb05SgbCUye9XpZvYmJb0vXPDtdmsKUYsx6IIPDs=@vger.kernel.org
X-Gm-Message-State: APuU4Z91N+thjUGlAo5HT+C7FjUICthT5k+qKcEluUsgfvJCdZ0w+rlP
	VC9u1oqTOZL+v3/HMBwNkV8PJ6ScD5QbWmMCX8sZzAdzhepCLM+PK1OrM0TNzGuf1/EBokMK594
	Sf6Y+It4uHLDqYceMKhmdRdgr9wcwfIU4lZvnsJ6xMrc+bqfwv+R3Iu/PZHOilvfOiSkqkC/Vkf
	RZmrfvvXm7IQBrwWHQNRp/o2XdTuUIP6WBm2onX9Q7hd/kGAIIQLURg9GMdA==
X-Gm-Gg: AYBFou3ArS30Nl9ONLWNdk9ezUqzIRUqpEoq6rVMtTxLC4qKUKvEARcTrpONASiRZpG
	hjtOKzJ+gafi8/+5KVY0Zpl0ptDAzs8xKSu1Fx2gXB/psS0LZ7IsLUtXscvoRZ7SlhoWPdgDx3q
	/SD1DupWIRU7iIAanS8tXrR8d3ez29liSppk0M15EL5bZ45RHmpxp0k/mj8BQosDzSW18zN53XN
	ybHD8x9JS4yDilYwxud87OxfD2n7s0mEwX/+2VZu5+qBYLGULTsNEXxZ/rsO0En2D9Jw3O8UCur
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id af79cd13be357-949ba9c31bbmr378076085a.30.1795163624117;
        Fri, 20 Nov 2026 00:33:44 -0800 (PST)
X-Received: by 2002:a05:620a:40c2:b0:949:723d:f7ce with SMTP id
 af79cd13be357-949ba9c31bbmr378072885a.30.1795163623658; Fri, 20 Nov 2026
 00:33:43 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com> <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-2-3fed518decfb@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 09:33:27 +0100
X-Gm-Features: AclHuK_13YVfgPHe00rWHz3MmtX2ZPWjOWt7HTHyfWW_D-cw5T1GuCsPWKT8z54
Message-ID: <CAFEp6-2wAR7SSMP68g25px2-5NA9ppRoWP-R1RtBALnDGi_6Sw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] wifi: wcn36xx: Do not enforce interrupt trigger type
To: arapaille@atlr-engineering.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>,
        Eugene Krasnikov <k.eugene.e@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfXxY/HVQTu5NWZ
 7sfr9UULjlID44in9rqrN2klAdnfE+Htp9qJiKWuFJkwBJhjiqRgFbdjzc0GwfpTzx2COO05j4u
 qIc1y0if5Pn0BfToylbrA4yM7EBeSynvAfpf0DDZk51jr03l2e432pyz4fnM0scHjsKDHhgoy7J
 b38jsxYEZjUzAOn4i0DJ5XYQdujuUdmtdx72LzDgoHiImEEdnArMYEe+HYvhJymNG63ub8UQ2TC
 3QJ0mq94QPltcvMsc6lPDOhCI48WOkvlGdL0nSFtt5P4duqso5tLXbCVYzsbIcLNxRUuvOTLvEE
 liUenDz3C14XlReyHcGImllMeqe8AgJYpAmES7SCPdqs+9cAIZzn3uOC7xS5szRvFkycJgk0F6X
 6m8ewO0x/Oy5l4TxMushmCUT3hR5V4i/Yx0fzir0iK0I6rLoaQbLu1VY38BXIK2KR3foSjdCZgw
 Cigk3/TvxW2TbHDVAGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzMyBTYWx0ZWRfX05089XxubD01
 tDKLO7kQcfB9amwSU7Atquzf/KhpfRz2q1ZTzhhbB89XPxpW36lBLhb3nRHy2gvZZyWuOEL9FbA
 f1DtHJjSq6fn60uCE+HNbD9U67ltN3E=
X-Proofpoint-ORIG-GUID: K95PUMlgtHTqnF4gBuG7Ou8x-wzZibZp
X-Proofpoint-GUID: K95PUMlgtHTqnF4gBuG7Ou8x-wzZibZp
X-Authority-Analysis: v=2.4 cv=KuHYSmWN c=1 sm=1 tr=0 ts=6b0005e8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8 a=EUspDBNiAAAA:8
 a=laIMyccDeTmSpVvBuxYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200033

On Fri, Nov 20, 2026 at 9:05=E2=80=AFAM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> request_irq() with IRQF_TRIGGER_HIGH stores level on the IRQ mapping,
> which outlives the driver, so a DT with another type gets "type
> mismatch" and -ENXIO on the next probe. Rely on the DT as ath10k does;
> every in-tree qcom,wcnss-wlan node is level high (msm8974 since the
> previous patch).
>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/net/wireless/ath/wcn36xx/dxe.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/dxe.c b/drivers/net/wireles=
s/ath/wcn36xx/dxe.c
> index 801f1218ef..7852f71368 100644
> --- a/drivers/net/wireless/ath/wcn36xx/dxe.c
> +++ b/drivers/net/wireless/ath/wcn36xx/dxe.c
> @@ -552,14 +552,14 @@ static int wcn36xx_dxe_request_irqs(struct wcn36xx =
*wcn)
>  {
>         int ret;
>
> -       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete,
> -                         IRQF_TRIGGER_HIGH, "wcn36xx_tx", wcn);
> +       ret =3D request_irq(wcn->tx_irq, wcn36xx_irq_tx_complete, 0,
> +                         "wcn36xx_tx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc tx irq\n");
>                 goto out_err;
>         }
>
> -       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, IRQF_TRIGG=
ER_HIGH,
> +       ret =3D request_irq(wcn->rx_irq, wcn36xx_irq_rx_ready, 0,
>                           "wcn36xx_rx", wcn);
>         if (ret) {
>                 wcn36xx_err("failed to alloc rx irq\n");
>
> --
> 2.43.0
>
>
