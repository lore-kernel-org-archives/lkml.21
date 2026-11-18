Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033763;
	b=PE3hyPoPYlbs1lHGx3lhvWffjW5wvtDbnudBVD2Ez4Obcu9nLMwpkaIv8Fzelao7egkn
	 AJqKPsbH5V9mju72SP7z+UzyRLy/rDIWM8CHO3uB9bzv9o1C67pv2mGWvnfDCzdHXwjc9
	 6xhvWRzG+LKfo1JKPju6iXxf1lkTFKmTQYiT9eC9cQ12bNo1dJrHnpISE2qjWaULb4IvN
	 Ho8tLCtYJFHwNAc4BA5kfrf7seXhICgkVBvWNU+5slETZqA+2amv+Qh+a6SP+9ktQBvJn
	 r6fk+TRZCTAptvXlMhbAeVPeKzFbNpt5G92tmgZXdz6P7ZtOAWvrTAkbGx3a7bOso0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
	b=adQtS4qy8g1FnB3M8ZFdZ74Ab94gSas+HRMfo5QnieMhVHRDQBbdl28AmAvmRossI6Xo
	 nBevoRA4N/Ff3ITAynZJBZ7qGt2u73tCruNRoq9E8pl+F3Aynv4AWH0PAP++KhW1Zy+Bq
	 uu3Ok1NevXKn+an1eejb47FAZR4ehncKik66M7XWjq9wcHRGWUQSFWyU/9XI01VcBWgB3
	 +bT/0KSyJn/24yO8EaMwS4CfzjMEN/mYe23d92bvvgRqY76/L7+iclhlff/y+PP1PP1gW
	 BRlQH3w7fbK8evIimMutLW+ePFz9hM91HxqzASfUHDohrTDPxZnp/ph8MaRjHf6jKtA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NpI+AOGN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8458eaM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21631606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:29:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21631606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NpI+AOGN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=i8458eaM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJOV4f2131157
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:29:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=; b=NpI+AOGNxh4W2ZLD
	HOhzwaT1akLSDIlW3XEsOdjWcgZtMs+ZQzFqVnH0kSism2DrVDPNt7XuhBGa+yBB
	myuAJpnzgpSpvTzVy8zYvhSq2YgsSiiDChItUZvNSWsfkLu3MVtL1jqQuNgSm98N
	5gGsos+cgu+iBbme89DgppbYmsFNawnBS5rWhodvpB3Cl8W/splxREx2A098UykM
	TIirVzER2HS/GCATtoB1oCp2t4ZQHIVGIw/XE2aAW078PdOaQN3OdYh+9KqAU45n
	O7MItB4FTn+ge8u103d/CxOxw3jawwp3ZzYggt+dXCyBeyAcb2fobnZlG7L9rfix
	nxAFqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrsqp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 20:29:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f32050e72so384392385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:29:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795033760; cv=none;
        d=google.com; s=arc-20260327;
        b=DUATzJWH/SkImlhAX7VJUgypkVN2YnnlwlP6XnJcB8tF+MfrMUucycM8/QPY9BHCu4
         E2YpoJXQpj/UixeBjao2aEiV2x791xAeFNbVYMRk/mMoT1NbKqKW4liOZdBs939kMylb
         Pg7cMeoLayvFOqE+j3iIdw/Ksr13GHZ8LaIDYiteNIAvd+4+/fGDQoFOEJ7P/7Ip0+vT
         0dX7k5QnhNfHDnH3Utn3b9GW0pNFMhpUBlcnGhe+4pjc9fiShuDiiePL7IeBwpmjR96N
         q5PrQpZSYlyJjJNVWYTQmJpZycMlhKM+z5BZNBClOQzHOBHGVyEGAqXhPQO2N/Z0HLZv
         8Cvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        fh=FNVOVL2Ro7f4Qxs67mnzcm/qggNjwA7Kgnlo7pJun5s=;
        b=K/0LG1/QDRqw99LzGrmJkE6O/DTnZDhcp1Wmtn8/0tlUSM0Syk7ppOtr9aZ6JLoW7H
         DN9lT5onIRVTKPfFfTzky5S3QlQXTvH5PhkwT+EPrYCfD+phKQCbKiXKOyXH6RbuDMG6
         Ny/cXr1kSxoVMP3YAOcANu03QL0mvOcqtZvwZ0V0UHvB/Pw70ez9A4DBfU9jRRWW0PIQ
         6THwraIoclwLbpR0KBfklSJFHMpV1ef7mirfMT80A9pvPcXEUlkebp5RNTR81XIKXi/r
         ck9NVrmBJ+0NvX8REpz4KzC4Ibtbqk756VKNVSdUwXHIvN19yb/3Sa24lRqRF6D05dvx
         GXxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795033760; x=1795638560; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        b=i8458eaME8qijPCjB8rMf3haEX5zO9kXHS2/pFcOdj/qJUYKCYc5B9KV99f44W/C96
         +0p0AWaxAtC8eDMiTkCizw/nSkm75K2oOon8wbFwd6l9/DCkZ+g2aSgk6mFHYGARxnEa
         mJmcFw+UEgtDrw4WsFiKjDkacswXaRK5AbWvZERemiPFkkZWvZU0FzK7Rd6wzoj248Sc
         5h+3gfU8rJtBMWn/XY/Hu9HC0GY0Shu3uYIb7ZtO5Bf15djfvE0ihD0CJkXGzCLJY1x8
         +TcAT/64QQ6P50aVokCbS4YfSX89l0l8CacDW+V3boG78bztZ5GJwTnEhXs9xeu41748
         Pz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033760; x=1795638560;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uafzx/JmUMCcPdLuNnrhGFghiuTegcyFvb8LVqv/8Rw=;
        b=f5gaSr9f34diiiEgQnHZLyp8d9NPfVD+16B0fHjHuf+txC9NZSBE32jtFma+5xxYcz
         mJEtEi314GBUqc65PkXyAp05Ktc/w5ws98J37aA8MLMQuq3kqjhhi0cmgNHPKQZXc1+e
         9Eyj9+Zw/+A1qwkBGuYTZIH/9qnVhmRLmw+qOQ+3IuQfCKjHnWXx/92oIShaLruBnz5L
         fqzJgCwKp9sKRzPBqi9nNBK2J2bZmjVVbo5FG4w1DbMpO4U5XqhflWEEH4U8SN8E29Qi
         TzGQms+u/gaa4+nK3a2B9/OokJsKpeOkpZ35AbdyCE3q2BBv1E/lJ6FUQsTyk8YG+7VH
         Tb5w==
X-Forwarded-Encrypted: i=1; AL+hErEVm6SLI/jTRmVyVQBSA1wXG56FNeEaLV3ganGJm2pKKLyspWZE8VVa6Ore7y5EmEWB4kLdJnsNy6JdtDY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/57O6QAvY9QZtoJKGynsNeqKWtE7+gl0Z+nIQ4ZjZjXK6WoQrl
	RCX07ZmY7NGqzhp6Jj4fiexmnkBOEE/hll76ujib0s/HjlIoHg7Pa3y9/GMg/EtbHxaZ28xcCqT
	zPoDZ5gt4C6SA46YqzcqrKja2M40Wbwba3dRpWrf7AXsGAb7fcQcYYi5s08S+rTaveKG8NDcB+b
	uzrngD5SsLPlPmywBiSw8rs2/I82c1N+zv6FxvXtqkaw==
X-Gm-Gg: AYBFou1m9i30zzF7WZuuT0maGSk3THogljIy+hOf4C4KXQEi7OnSJB8BZhyM/9TA05u
	6gdDl8R3r08WCciBxM1azkc4mhjWPkQFNV6ely7ZxItadFz/2va7npDa4848LuJifghUwDvWfMT
	NGcI9BYTq7rYbUzf1P+qTf1jz+uTV5hoeB1Sm1a4mmgN7mT5Wx7sSZ35hlRVO4SV3UgE1jefQTs
	nFiuM6TPtGWZHkkhOOleyyWS9ADPTcmQqBnDrKDhm1H5vdid8Uzc7K/NmH1gVpbPGf6AJqmNwI=
X-Received: by 2002:a05:620a:a194:10b0:949:9f1e:d8b with SMTP id af79cd13be357-9499f1e0ed8mr341707485a.16.1795033760299;
        Wed, 18 Nov 2026 12:29:20 -0800 (PST)
X-Received: by 2002:a05:620a:a194:10b0:949:9f1e:d8b with SMTP id
 af79cd13be357-9499f1e0ed8mr341702985a.16.1795033759630; Wed, 18 Nov 2026
 12:29:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com> <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 21:29:08 +0100
X-Gm-Features: AclHuK8JJhcd52hfVRf5gMzyZMF7wsPFyMwkvy_HKeVTiizUypnXwZQFHaYWU2k
Message-ID: <CAFEp6-1OnG4B_D59fW4WJeTOXAs-Jm-0Qg+yqwzM3j6tvya7ug@mail.gmail.com>
Subject: Re: [PATCH 3/3] wifi: wcn36xx: Stop waiting on a dead firmware during remove
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX7EFFi0EllvQc
 58CHCiwmkmpKkuVZ9tlAsMwCq5yEvpN65q0sz96uZ/bbVnMt+2Pv4IxeVoCTkw6DqBz7sTkssLl
 Dk2TV4WIA4D7HM8Em7pRGmfXxZ5FvN1VXb95Ki1txdbc9q8YllZeD8BYrq42qoQrVpcUV5nY21r
 qYlq+SjG9DHez/0UhRpZxS07M1UvfZddNRP+P/fjqtja+d2EMRysDGQThz+KvkbgSpPrq5YGtoZ
 tzRp1t2ujFpqbDdd1IrHc7Hp+GS0n3SnQkztcIwKu9WfFC48RZNjjWyJX2YzAyXjE8y+6ge4R5W
 FkLgJV0aCPUZhGNNkYoma7BJrsgqSl7IEwLv7jckGvWq/8iwOHe28V/6TAT6FmlZgswhXt5Wet+
 JPGyoWAvdI+R8FXnihM5sCbmo8x4V9g5ITKSw0OQVMLggiEBOIrPW65DihA+DoOuGHbkkdNid25
 YaEGf0myS8mTTtI01cw==
X-Proofpoint-GUID: 5D38sVS6JuNrJ9b03VB_HHJBe_Lseizq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX4KktdK33X7ms
 Q2wduMdgO9cx9NPZ9iBf4UFGJnSsANKzk5m29ZEBwz1aHNLOZb2nr0M3sA4gYyhlvDf8E38n1td
 cnxXBqjaUqeS2vrDMqWMTvs84RE2yH8=
X-Proofpoint-ORIG-GUID: 5D38sVS6JuNrJ9b03VB_HHJBe_Lseizq
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afe0aa0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=Knk3v0qlAAAA:8
 a=fXm7JzJIL1tcRaoap_oA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=L2g3GqtBoyQv0ocsUjqh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077

On Wed, Nov 18, 2026 at 3:58=E2=80=AFPM Alexandre Rapaille via B4 Relay
<devnull+arapaille.atlr-engineering.com@kernel.org> wrote:
>
> From: Alexandre Rapaille <arapaille@atlr-engineering.com>
>
> After a WCNSS crash, remove sends ~16 HAL commands nobody can answer,
> each waiting HAL_MSG_TIMEOUT: recovery took 160 s on msm8974. Once one
> times out during remove, fail the rest at once; recovery now takes ~20 s.
>
> Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
> ---
>  drivers/net/wireless/ath/wcn36xx/main.c    | 1 +
>  drivers/net/wireless/ath/wcn36xx/smd.c     | 8 ++++++++
>  drivers/net/wireless/ath/wcn36xx/wcn36xx.h | 4 ++++
>  3 files changed, 13 insertions(+)
>
> diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wirele=
ss/ath/wcn36xx/main.c
> index ad8a4bd910..77a1029108 100644
> --- a/drivers/net/wireless/ath/wcn36xx/main.c
> +++ b/drivers/net/wireless/ath/wcn36xx/main.c
> @@ -1651,6 +1651,7 @@ static void wcn36xx_remove(struct platform_device *=
pdev)
>
>         release_firmware(wcn->nv);
>
> +       WRITE_ONCE(wcn->removing, true);
>         ieee80211_unregister_hw(hw);
>
>         qcom_smem_state_put(wcn->tx_enable_state);
> diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireles=
s/ath/wcn36xx/smd.c
> index c0b4773458..d07ea967ac 100644
> --- a/drivers/net/wireless/ath/wcn36xx/smd.c
> +++ b/drivers/net/wireless/ath/wcn36xx/smd.c
> @@ -427,6 +427,12 @@ static int wcn36xx_smd_send_and_wait(struct wcn36xx =
*wcn, size_t len)
>                 (struct wcn36xx_hal_msg_header *)wcn->hal_buf;
>         u16 req_type =3D hdr->msg_type;
>
> +       /* After a WCNSS crash every teardown command would wait the full
> +        * timeout; one is enough to know nobody will answer.
> +        */
> +       if (wcn->fw_dead)

It's not clear from the commit message why you need two variables
here, why not simply testing  wcn->removing.

> +               return -ETIME;
> +
>         wcn36xx_dbg_dump(WCN36XX_DBG_SMD_DUMP, "HAL >>> ", wcn->hal_buf, =
len);
>
>         init_completion(&wcn->hal_rsp_compl);
> @@ -440,6 +446,8 @@ static int wcn36xx_smd_send_and_wait(struct wcn36xx *=
wcn, size_t len)
>                 msecs_to_jiffies(HAL_MSG_TIMEOUT)) <=3D 0) {
>                 wcn36xx_err("Timeout! No SMD response to req %d in %dms\n=
",
>                             req_type, HAL_MSG_TIMEOUT);
> +               if (READ_ONCE(wcn->removing))
> +                       wcn->fw_dead =3D true;
>                 ret =3D -ETIME;
>                 goto out;
>         }
> diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wir=
eless/ath/wcn36xx/wcn36xx.h
> index 8c43f67bd7..9e5f3918ca 100644
> --- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> +++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
> @@ -276,6 +276,10 @@ struct wcn36xx {
>         spinlock_t      dxe_lock;
>         bool                    queues_stopped;
>
> +       /* Set in remove; a HAL timeout then means the firmware is gone. =
*/
> +       bool                    removing;
> +       bool                    fw_dead;
> +
>         /* Memory pools */
>         struct wcn36xx_dxe_mem_pool mgmt_mem_pool;
>         struct wcn36xx_dxe_mem_pool data_mem_pool;
>
> --
> 2.43.0
>
>
