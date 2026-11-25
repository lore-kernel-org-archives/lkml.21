Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795620280;
	b=dAWIVYHfJmCHoUIeVpJrLjSnRNer/AnaKR1/ZKaqkPsrigWrcIpOeQrwOs/AiB4LYpGn
	 m6lg4I5eZ+XGG1s5NVIAMcPQTulQJWOtY/BR6KNfpy5FNXt8vVx8yWynetbBMJE5iBAsG
	 CSPo0PMOFsSnCALtn4IjxXeh9hAw42GjoQlqI12/mhsQcndf1SH5BPGGAk5HFVUu4Huqa
	 PFlRmsUGBNc1uzPo+wFt0E6mScYVPLkbnD4jmE3dpDns0NEFVu1vv0llnoyWmRZtuu8jN
	 MW2mg4RbNuwPl7YERN1D+QG7xs66UxrOJ98QIBiVrMKLljngs96kxK6l5mxLkYW8uRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620280;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Y78ML+3fbUAaF8Rj9Glw+6B9XuZYkePan1Q5MsJuoto=;
	b=JvufM1Ducfe/2u/zUMtxZplscl88vywPzaVcACeLfKAO5KUPCb4/oPb9LrI/LA52a2MH
	 +MPxDx0okZFKnoYmFjDpwjnaYiclEC4p1/va5ljLbORKVVk/2sNjTDgdMaYK93JFJ8TqG
	 kqSfyNZaqT4iI9SFFcO+i7S55VrnP97Tx2TQ2PAdWAWk2THIoMpGU6h+3ooutKN16FlZp
	 6B2pOgBrJRd0YAWWSP6j01qIlnwKhMSTqwU2MOibjRW6aMyhgvuWyJwb5FxTtwmBmzyul
	 4xgKrZOCvjQgWh8pZS5WzkO7oB9SRFuKzCpnyUPEf8wTrtlLf4GZG3xXg54IOQWxkzA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yuo1goiJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CzHyANSb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7831606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7831606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yuo1goiJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CzHyANSb
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APEMIQu175384
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y78ML+3fbUAaF8Rj9Glw+6B9XuZYkePan1Q5MsJuoto=; b=Yuo1goiJ5qmPqUx/
	ZyTezbGG4xC5I59wiMc7Iz9T9+7q7RIcmrIKDNOJsBeSndc6msBmsChfMPPTo05Q
	GMdzgqrGWl3VFhQM1t3yQtSq1UJGeC/ks9BWUf1YbvsMMwp9l5za9uQ3JPLF3hB4
	lKYhuTKLl6jhKOIpkf+wdt9x78mxk3rt/0UJevle0lMv2b222TCemjPLr9DhRDc+
	3+D4JfF1uZcdDzHIdpCcQlbClrQCza7wwsAelxuYA8mmSlvTgO7yM33bxfUNvmbg
	xsl43Qdsj6vbS+cbITAODU4lIO6QVE7raCl0rOFhvdTg9TKE8kkTN/Vh7M75WvPl
	HsCpcQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2sfnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:24:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cdd9fa2a558so4675677a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795620277; cv=none;
        d=google.com; s=arc-20260327;
        b=L68Ld6fnXXJDOrjvTMyQz66ZVC4nlKIST8PzteDTAd3YPRVVnaHHxaRKk01bD4Tumg
         eSHzalGUQBok3PyDFMtApre6OzlHnhNFJG442UMt2e92MhksIPbSl4oWgJpdQSpYD9vC
         85hEE5RfV4jEjUMRiQJOLLyg+n94UkhVijiPM0ENpY9ECELTXxQqPabHJnBUtLsfaPCU
         uTWGKJtq53laaoBJzuxcLW/vtNUosopfEXDgePm+6QBPa06li0IrgRy1vWV4RvN+1u8S
         A2DcejT/OlqUERwNufRafN+F6WmnnScNPowtGWhZpSzhBmQLGK9MIgF5r9PZjsb3rzww
         qjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y78ML+3fbUAaF8Rj9Glw+6B9XuZYkePan1Q5MsJuoto=;
        fh=kzZo96jGnUeh4aDK3xHJCxzNax9ZvtbwjcHLCj0O3Rc=;
        b=dKEkzpokdHPou5GZEJt/9utpif8+XvZByEkZQxM20vjeBDJF+9wDGPHoDFNvtEqTKC
         ZLpyqpoBaouDN3IDLbZ6lSJIm30DDCM6jnohfFcu+1cswOJ5SC8Y5ET2fw5vz2jgGwSr
         DKwwA/RXBkKXCHQb+I0OvQMHlmD1AcFHzqGWlKKaE+wx56UO5XTxePap4A8SPxQjlpwT
         BhJqUyvIxcJH8moNWp0UK5qUTjJpqlh8AG6gptrajE38sp7uX6CE6+3BkE4HQ0nxTsju
         Zo76VP8CGwkrY2LY63s/LAiwUa7Z0wHDMlY110PxiBNIgQ9F7NZxHJqr5MYFLn2xS/S7
         EtVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795620277; x=1796225077; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y78ML+3fbUAaF8Rj9Glw+6B9XuZYkePan1Q5MsJuoto=;
        b=CzHyANSbXH4wywso9PPPNEDU5HlqHPYbgq9er+So2v407L2Yd0Xoja5khQn9ufBtQz
         C+FIHoxiaMl2mSZFtHWeg5v8YyHFU7UPi0ns/KtacA/m9SvF0CRfHl/3qKAXE8diVIi0
         4rPcSys41zqvm72PHeYgMA/8x1FUT+c9gxvGZtBrfT13U9Sb7dc9NxMKkx6O14CX17US
         jEQLxmWFawcbyw9XTNUD63OihOjyENflrxG3HYjaIEnhhLlqx466T/h3LDZqzEucsGve
         +7cQs86MYRKLA1W+T3zTIpQ99xDErZRCv4ODscDgAFQY6o5ZyyfBMDZKH3+aV0+DViKC
         huhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795620277; x=1796225077;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y78ML+3fbUAaF8Rj9Glw+6B9XuZYkePan1Q5MsJuoto=;
        b=xnq1bBLflLrQGtoftlv+uqGKtfO2acIKh7TBu+A4yMJ3yEyFD6vGGH72zDrDFXctDv
         aZvMqNKzVRa2KqW53xfbWMi587XvaxQWcMeIqcwqCgFxkBqwbY3SGfF28ebBNeaOOG/o
         7kuc0DQBDbp5G/8WaFeLUfzB7or7hKdj9A0G7qrCAO0FxWjMNpuhyLzIO/Bav9KfcxEV
         Ou5h0rdRno06rCGsCRjZdEBV5RVphE6PPsoeF35HI3zFa8JizGFFLF9XEsLjlDoBu4fL
         q4U0J06A1CtmgRbrTTXhf7RD9is+guFYMo1XOSUgRnF6J0vPTtgEXpE2q9zhjx+z9EV6
         nnRw==
X-Forwarded-Encrypted: i=1; AL+hErGmZNeT2iLFwwHIMcTVKQt8vg3FewD/d7gkkIVbQDGMyFd+4ThYyf3Mf8rTMIzIm7Mt3Q9mqesD0RkjgIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dHJKQ4Jwkxcq/C9PNnbq9hCxKPUbSt1lEOCYJi4EX1SUh96sn
	LuQBF6rWDISUyrJn5k6R4P+XXQaxJXmhwqTcRwACSS8UV96Moys8kK9exwnGFioMtgBvsngwNYW
	eSHajgj4SfET5C2vgSG2o2mHrCBtVXdSioqH8VfjqNGiGUCpol2TRkzK4jlxmryEfwU4dlio8DR
	8fKW0O+255hfwD8Nwy3AETT9P1PGB1ZINzD8bz5f5wEA==
X-Gm-Gg: AZFdTZefsruCJdLOHW58lR8G0jlEUosrkiIDbIsTw/yxAeKRNBhXlfagiYShVGrb8oz
	+uY4R9fllf9jfm0+5Zwp/crXwYPfIx3TfVmVQGfbmg2JqiTBHBag/VA39DnpOo7wPeHqU4ymXOe
	BsxgFCLojwaKhk0KTLoIJWepQZ12kr57cPOUfyrJxjA5SPzoNVIo78wEPp/Q==
X-Received: by 2002:a17:90b:39a3:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3b41cb20e66mr19332068a91.54.1795620277275;
        Wed, 25 Nov 2026 07:24:37 -0800 (PST)
X-Received: by 2002:a17:90b:39a3:b0:3a0:9c9d:eb18 with SMTP id
 98e67ed59e1d1-3b41cb20e66mr19332017a91.54.1795620276536; Wed, 25 Nov 2026
 07:24:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-fix-rockchip-pmdomain-power-on-rollback-v2-1-3e4e93a19996@qq.com>
In-Reply-To: <20261118-fix-rockchip-pmdomain-power-on-rollback-v2-1-3e4e93a19996@qq.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 16:24:25 +0100
X-Gm-Features: Aa3M54o8dqLPD5uB-WeLwhOdO6CQFYha7MYFNep3S3olWqjH0jSGnIbrJ4DpKTk
Message-ID: <CAPx+jO8hTrAAoZgJKK91yF9z3CaiB3w4DRvvgDz=Zm_zxU6g6Q@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: rockchip: Roll back power-on when leaving
 idle fails
To: 1579567540@qq.com
Cc: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Peter Geis <pgwipeout@gmail.com>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfXyJzfeY9BGpIf
 2mKCY10U7d+aBEsksMOuJbXxtC8Vu1p9syFiXj4CaJlSotiXylWP7b68YDG6rO8WR8DEh7zZ+KV
 7S6zVshMv4V0E046ZoW+Jk2dhA/iffc=
X-Proofpoint-GUID: Jdth_EvpmQHh4u2r2SqKhjjYW944YM6K
X-Proofpoint-ORIG-GUID: Jdth_EvpmQHh4u2r2SqKhjjYW944YM6K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA2MSBTYWx0ZWRfX8la6hX3yrdg8
 nny9ILdv/ItNovbKx8jnETZ5csbQwbEdT4GAcUMKoRO3MvvNI0qaTPTeJvIte2QU/6RnC+ob/5J
 3ZsBWbxcMKq64yPJVB87uhqrZW4Wu4esYmli/bWqYohVQ1LqZatFJgWaWm6//m0c493pnE/W/ZX
 b4gUSPlhJcoCV4IFJcv3TPx27vgm15CIGDpke+w88LbiX0P5nqZaILQqGAcP/aLT4b/11it6wrz
 jsfRXXkg3HkyWTUMo9VRinoNXm3XfxshFeXkWTk38MYutVVKBynMzA54APVNI6lOaNCZjZGvl/B
 oR+/LybY9h1qVPV8NlhCGAJ8n7Zpf1wocboGSthwxMqe/Jp5t4ElCUEH0rnoWEBSnA1+Zm3l9po
 +x+EiDuHUsBCoDNOOqx5y0O0DX2rRv5sSoz/8hOnEafipCi2Ib5WvNFQHlXtkzcM3zVXPZ/KXsv
 JBERwm9CBYTh1OqRtbQ==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06fdb6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=c92rfblmAAAA:8 a=dZbOZ2KzAAAA:8 a=bC-a23v3AAAA:8
 a=VwQbUJbxAAAA:8 a=mFHk9SUb-_LhEKcCAXMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=GvGzcOZaWPEFPQC_NcjD:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250061

On Wed, Nov 18, 2026 at 10:03=E2=80=AFAM Cunhao Lu via B4 Relay
<devnull+1579567540.qq.com@kernel.org> wrote:
>
> From: Cunhao Lu <1579567540@qq.com>
>
> When NIU idle exit fails after PMU power-on, clocks and the regulator
> reference are released while the domain remains powered. genpd treats
> it as off and may power off its parents.
>
> Request idle again and, if successful, use the low-level power-off path
> before releasing resources. This preserves saved QoS and notifies
> firmware while retaining the original error.
>
> If rollback fails, resources are still released and genpd may power off
> the parents.
>
> Fixes: 6b2690df3f03 ("pmdomain: rockchip: fix rockchip_pd_power error han=
dling")
> Signed-off-by: Cunhao Lu <1579567540@qq.com>

Applied for fixes and by adding a stable tag, thanks!

Kind regards
Uffe


> ---
> This pre-existing idle-exit failure case was reported by Sashiko AI
> during the RK3572 mainlining work:
> https://sashiko.dev/#/patchset/20261022-add-board-ok3572-c-v1-0-0b0fd85a3=
1ee@qq.com?part=3D10
>
> If leaving NIU idle fails after PMU power-on, the domain remains powered
> while genpd treats it as off. The error path releases the clocks and
> regulator reference, and genpd may power off the parent domains.
>
> This patch requests idle again and, if successful, powers the domain
> off before releasing those resources. It preserves the saved QoS state
> and original error, and uses the low-level path to notify firmware.
>
> Validation:
>
> - All 48 host simulations passed, covering power cycles, idle-exit and
>   rollback failures, QoS preservation and error propagation. No sanitizer
>   findings.
>
> - Hardware testing on OK3572-C: 20 patched and 50 unpatched NVM1 power
>   cycles passed. Request-write injection caused native idle-exit polling
>   timeouts. The fix powered the domain off in 3/3 cases; the original
>   driver left it ON. QoS and the original error were preserved, and
>   retries succeeded after removing the injection.
>
> Persistent rollback idle and power-off timeouts were also tested:
> resources were still released with the domain ON and genpd OFF. These
> failure paths remain unresolved, and genpd may still power off the parent=
s.
>
> AI assistance:
>
> - Codex / DeepSeek V4.1 Flash were used for:
>   - Reviewing and adjusting code style to follow community conventions
>   - Automating tests
>   - Collecting data
> ---
> Changes in v2:
> - Rebase onto the next branch of Ulf Hansson's linux-pm.git tree.
> - Link to v1:
>   https://patch.msgid.link/20261101-fix-rockchip-pmdomain-power-on-rollba=
ck-v1-1-59a45783e33e@qq.com
> ---
>  drivers/pmdomain/rockchip/pm-domains.c | 27 ++++++++++++++++++++++++++-
>  1 file changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/rockchip/pm-domains.c b/drivers/pmdomain/ro=
ckchip/pm-domains.c
> index 6abef60a5b4c..2c021784316a 100644
> --- a/drivers/pmdomain/rockchip/pm-domains.c
> +++ b/drivers/pmdomain/rockchip/pm-domains.c
> @@ -648,6 +648,29 @@ static int rockchip_do_pmu_set_power_domain(struct r=
ockchip_pm_domain *pd,
>         return 0;
>  }
>
> +/*
> + * The caller holds the PMU lock and transition resources. Use the low-l=
evel
> + * power-off path to avoid overwriting the saved QoS state.
> + */
> +static void rockchip_pd_power_on_rollback(struct rockchip_pm_domain *pd)
> +{
> +       int ret;
> +
> +       ret =3D rockchip_pmu_set_idle_request(pd, true);
> +       if (ret < 0) {
> +               dev_err(pd->pmu->dev,
> +                       "failed to idle domain '%s' on rollback: %d\n",
> +                       pd->genpd.name, ret);
> +               return;
> +       }
> +
> +       ret =3D rockchip_do_pmu_set_power_domain(pd, false);
> +       if (ret < 0)
> +               dev_err(pd->pmu->dev,
> +                       "failed to power off domain '%s' on rollback: %d\=
n",
> +                       pd->genpd.name, ret);
> +}
> +
>  static int rockchip_pd_power(struct rockchip_pm_domain *pd, bool power_o=
n)
>  {
>         struct rockchip_pmu *pmu =3D pd->pmu;
> @@ -682,8 +705,10 @@ static int rockchip_pd_power(struct rockchip_pm_doma=
in *pd, bool power_on)
>         if (power_on) {
>                 /* if powering up, leave idle mode */
>                 ret =3D rockchip_pmu_set_idle_request(pd, false);
> -               if (ret < 0)
> +               if (ret < 0) {
> +                       rockchip_pd_power_on_rollback(pd);
>                         goto out;
> +               }
>
>                 rockchip_pmu_restore_qos(pd);
>         }
>
> ---
> base-commit: 6f5c8ec9302c5ad8904dbdfe8cf2a538ff835572
> change-id: 20261101-fix-rockchip-pmdomain-power-on-rollback-c11e1014ef11
>
> Best regards,
> --
> Cunhao Lu <1579567540@qq.com>
>
>
