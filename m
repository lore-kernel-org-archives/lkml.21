Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795699945;
	b=fw84uEwwZuD2fJn9nEV4RAhVRpBuQZ/cInvzkTRxBNcX6ZqYf7Hgpl+AnZpfoIoZogm3
	 E3v3csloCh3t6VpdCxvc/uUs+6afNFKtGUhMquIj+6upqUG5TY8pqh64JoZj0XQLOlWaA
	 tdit8BHx5HfiA+1BdqsOoPvjX/hHAjuu+v7F/tzrbKCxuoCeznUnZPMj82SFqJI7MUAY7
	 y/yjPpF5EkyssEYP0Cbg3YAisTEDtm11owXgsxSJxhcLIk2QWItMQPKUICnCMG2tuk3PT
	 8WE7FAHKV/kdYv2pDEDTdfG6KR/zXqZxFGvoDm9bF1rUfXU3Pcb3QwX7Quz7Vmf0TeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795699945;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sI28Li+DzLKmJsQ0m+B2azDOTyIHcTaeGPC7ob45wUs=;
	b=nn2QxX0Pp+SwsWZZaYUZroPf2+5ymzomXDNh2nW49YxbdPNM4LMXz38JKpdr7DjbLiKR
	 n0KY0rWvCcSRFC395PqIPZMwZUz85+YQw7jE6xb8l/xSH2nDT7EAi6gUYSaByybAcInB0
	 pUSBBVTfXA/4E7BZDLsuArpFqbrCwiTWj+iODPeeBItc9Zah/9huMTWWPX3xsJpcW8tyq
	 Gdlaics/WKc1juiOEhoYT3hLX8xiRcr/qq3ev+llMvxeqUC+j/lxQhfgjfCkqmrJm8QGL
	 O/TnHQO/TY7sZ8ZTRxPt6LWdq4ScA6Os2AFo+YomYQ5e1qyBP72+S87nh/m4UAkvtQw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E8kd7VCY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SBvTLwR3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6887A606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6887A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E8kd7VCY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SBvTLwR3
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVI663476066
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sI28Li+DzLKmJsQ0m+B2azDOTyIHcTaeGPC7ob45wUs=; b=E8kd7VCYIxTT4Cpu
	lgGMUnLXpD0kZUAL6X+P5Rog3SYs5GFO2dju2DtYH4R9i9kNtjh0dDOym0Ft8QYZ
	g018+IOtBPipDyEAPe5srii8EzkRDO9lR6uoz6FjQE319ejxX2degYTOzj1FWaRB
	X0Cpe5Wqn/ljiQnqi0AIdDtud/gAQUMPkpUmv9yc0BZ58uTZIjGSRn/gaoUoqzaj
	Vjkk3BesHUMhzvq3JRfpwpC1MuBj9+LWobwpWirCh/qAIU10kOm7AqDDYFKGFwJc
	13hOiJWCZH9KkbeDaRP3cXE8JT18zUIBAhNbvFeH+aRh0gV4Pjp2PS71WT25SfsS
	8nmmRg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rhkd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 13:32:24 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f0f5721453so4826065ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 05:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795699944; cv=none;
        d=google.com; s=arc-20260327;
        b=G0IsU+5mPx18x2EX9fUpHx8jfcaUtuUhFFkiipPqT5UzI7pZZFv176vF8ThNI7CAf8
         GQWhL8ZA/AXeqZxep4zfq69L+wrIXdBBeZkbdRNNaQHFLVl/6sonasDSHhzLzO6B8OF/
         MQRWPosB0CnRx8ESU3anfxeuLHvCiz3Kub4HH6wx5gzWG8CXyt16JPDJcHZ8nEkTfR1T
         im8EvY/MKWgY2+hIlKkk7R7d1HfNYtVANnIRdf5hvIKqUjnjVVVXJn9qnkkHk6aCRLgR
         ERw7CVV7YeiUmx0Z2Xml7wlzVhPl70cNzR93vuw9jLAct/7zrbMqc3Q+YmV7sTyAVcbZ
         03DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sI28Li+DzLKmJsQ0m+B2azDOTyIHcTaeGPC7ob45wUs=;
        fh=uE9WApR2Xr8uYe2zWNXWy/NGWA1D3i62bj0FLatZRx8=;
        b=KHkOW/UYNM3YrboB2ErImA10TD4jqlGxPXNj5NbDneSptmlsnPKgzIPB/XYetC91cB
         K/ncQeLComSFbVCL/Rp+EIxpBqXPUahMsIoijSIrBtu7KOeXpCqqsMVM6x8miNb7YG5T
         HUmkozI1f541gmpOk2A8XKUBa9Euxmh5Bd+p2Rz2cK6VawrU1LQBKi5imjudG1iRwquI
         4WJC5QbIfrpuKBdCeNnmGNKZnneZarHGwj0OQMbr1iYSG2GQCCDte6bOI/SZCRbsxhQJ
         6JWrWjyreyzjAnrRnFkFH+vCR4joogNQ6RMGm3mSv2Sy2bw6hDYzdTANa/1OukUwLU31
         JaCg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795699944; x=1796304744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sI28Li+DzLKmJsQ0m+B2azDOTyIHcTaeGPC7ob45wUs=;
        b=SBvTLwR3xCLqLWk8VfxQgXoSSF72XtLrs8Ad5pPRfCBGelN766IO8WZA+H0XoKQjMe
         axZk3uHK6XSu5wwcOlXgrGDB58jDG14IfTLziTnVbVobLvGM/KdzEW/kQsh/4VuTwPxq
         Rqcqgl+JGxxCEwKXlHP/pYCAAg8rniJFk7KuWD39/Pi429r73++xZwo6M+LPzDMpZID2
         BcSKvZQV2tNrOU2m4nVt+geotB5Zb5NmlSYQ91Io01Tfka2TvM1m3ekDhmZeGAP6IeZH
         Ay7+YhA8OjWTnvrHX7L/uev4aG+O0aPXEhjps2RqiViNcQPFj41FkzsVmLzwT6VXP03d
         PE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795699944; x=1796304744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sI28Li+DzLKmJsQ0m+B2azDOTyIHcTaeGPC7ob45wUs=;
        b=z/0/jE6+0iVK+1l0n5OAOguFfKsbThsCKl5uwIKLgeV4WySUn+17fZZBWOBG+cSNgC
         gPp4sFVCpoLCuG2kQVeyfW3VZbJR+FyZuTQbd/EmDWb6v+EEpSC/NAv01YvPBJtFtjKk
         hVJezVCVLG4XdCK/O8UedYphWWD+7igmcmX7jyT0jfovXY3Ci1T5gKRG0fChh5yfTTbk
         0xqFaw1yEsqh+p5MRMbBHaFMN0wOAFut2G791IMQgf43eKG1ZRrobVRUVar3ZR2QXBOw
         x+Nt+Er+KBjvz6wpLa5uv4fNSJW7TAVmRrl+AeE93bqAm7f+ZpXoXqlhE84B7pURoFxH
         EbCg==
X-Forwarded-Encrypted: i=1; AL+hErHHZU13atixz0Co5+KRWkxcjoXGAQc4HGVobmui/byHR36OqE4fMUgYv+mpO30rFTjKi4MisZ4JoXixX+8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+LcHO92MNson6FazvT+g0yi6mRZQ8bUf9SWQOOlUW8b+Ioh0tE
	J5xo+X/rw8gUPVQhxIytgLTE9wfiQPTsYiayifyOcwqkF32Qb6v6t+tpPDI+7/lNzCOX1QgrsCN
	6U0+IEGS66mUVqVtcvcSj+m09gDZO/MOWN/kKsaAs5bZK3yewA999CF3KzE5upWRBEQhG9OAVas
	qG2lyyToCouRoUQpsHh5i5Y6PRfFhHvQo8aC9AEZF7DQ==
X-Gm-Gg: AZFdTZdCcG1gA36wSotg61EVRfE94W9GTDuJFfCXmfi21OrGbTMuJwXX2tobJVYaMv9
	TeyHUzJSsU/qxYj0ldkRORTVs096MRzKEfCa5xnf77BWEiqm2wAjd/gVkkt85PiU7Ka/hm3zAJ7
	qJJXJp2XOzNy9tXXkMpCOtbRm5Hk9k1dbTL5t60Ha16y7RRuJfTygn44Cm7g==
X-Received: by 2002:a17:902:ea0c:b0:2ed:15af:d38c with SMTP id d9443c01a7336-2f03ef44c04mr239219805ad.4.1795699943970;
        Thu, 26 Nov 2026 05:32:23 -0800 (PST)
X-Received: by 2002:a17:902:ea0c:b0:2ed:15af:d38c with SMTP id
 d9443c01a7336-2f03ef44c04mr239219555ad.4.1795699943484; Thu, 26 Nov 2026
 05:32:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-add-pmdomain-tracepoints-v3-1-1b41d412b455@oss.qualcomm.com>
In-Reply-To: <20261123-add-pmdomain-tracepoints-v3-1-1b41d412b455@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:32:12 +0100
X-Gm-Features: Aa3M54pWNY5rCJkG2YtJadZQS6MdGQmAUqNo-VtLVNXPchDOohVuC4g745cB6ME
Message-ID: <CAPx+jO-M-Mm72q4QL+SGiyZ_8GPLomYGnPH0JVEsSUkt0+opBQ@mail.gmail.com>
Subject: Re: [PATCH v3] pmdomain: core: Add tracepoints for domain state changes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX3cjPdsSrWBv4
 7wgtUz2Qo1laGzzLZquiss+2Z6bVUwpCHG6jIlplEiUAZWCqksnAleZp+4dRKyvN0VCPtToFVtP
 LqnuyX+v8jQt7vWtQpLYHH31tTbX7yNJoxjpkDs+P+Aj9tIOYHO7vHpkUvD6/7Vfl8cdj07LySL
 o0/4rz0tjwhZdcThHcTwgrd+sP+psjUW2l/Mxy9lvbH1hfZaydz0nHPmCtz3duxNzyeHAjWUT3e
 21jzVyUf5VePEbCM1jUNpFeNlSJQYXnzJNCxt2kyktATTnJz5ILz1T4TflGZFq50p04MmvRwhXe
 kJf+fdogDLX4a06Xpz8ruNEc8+IqTaxM7ruSTtVpQ4C6oc2/jV5mVB8EBsVSd6+IbgdefZ4mH23
 GEOa/8Y3xKyq/H0vwya0P+hp6vxpctDO00vlFgknQVcGr9KOEQ9UWoLMeiydzHXLNs4JQzayIC/
 dftB+O27EKhCTBcc9tQ==
X-Proofpoint-GUID: 82D808GWRUv-UiWZiuw2YHvhD0hOeT4B
X-Proofpoint-ORIG-GUID: 82D808GWRUv-UiWZiuw2YHvhD0hOeT4B
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1MiBTYWx0ZWRfX6Wla1VHo3Y2R
 Z0MPjGRQYUJO8ZSAiaxSl1YpQlqq2CVVFNh/L7Xjkcw5DYNMCpxn1WN+zFgLCJl/eTnz8oVLHbc
 NcvxNBA3aiACfB3LYXQHziUs4jU4drM=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b0834e8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=DEse3a4IbsX6LT34LuUA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260052

On Mon, Nov 23, 2026 at 9:23=E2=80=AFPM Abel Vesa <abel.vesa@oss.qualcomm.c=
om> wrote:
>
> Power domain state changes are difficult to correlate with device activit=
y
> using snapshots of the genpd debugfs state alone.
>
> Add tracepoints for domain initialization, power-on and power-off
> operations, and performance-state changes. Record the domain name and
> initial power and performance states at initialization. For power
> operations, record the idle-state index and return value, and for
> performance-state changes, record the requested state and return value.
>
> Emit the operation tracepoints on both success and failure paths,
> including power notifier failures and performance-state rollback paths,
> to make failed transitions visible alongside successful ones.
>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v3:
> - Reuse the genpd_power event class for genpd_set_performance_state
>   through DEFINE_EVENT_PRINT, to save memory (Steven)
> - Link to v2: https://patch.msgid.link/20261105-add-pmdomain-tracepoints-=
v2-1-10672995e155@oss.qualcomm.com
>
> Prepared with help from an LLM-based assistant.
>
> Changes in v2:
> - Initialize ret to 0 at declaration instead of assigning it before the
>   trace labels in _genpd_set_performance_state(), _genpd_power_on() and
>   _genpd_power_off() (Ulf)
> - Link to v1: https://patch.msgid.link/20260924-add-pmdomain-tracepoints-=
v1-1-d89f3f0a6998@oss.qualcomm.com
> ---
>  drivers/pmdomain/core.c      | 30 ++++++++++------
>  include/trace/events/genpd.h | 85 ++++++++++++++++++++++++++++++++++++++=
++++++
>  2 files changed, 105 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index e0bf30c59cce..c8bc57407634 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -29,6 +29,9 @@
>  #include <trace/events/ipi.h>
>  #include "core.h"
>
> +#define CREATE_TRACE_POINTS
> +#include <trace/events/genpd.h>
> +
>  /* Provides a unique ID for each genpd device */
>  static DEFINE_IDA(genpd_ida);
>
> @@ -510,7 +513,7 @@ static int _genpd_set_performance_state(struct generi=
c_pm_domain *genpd,
>                                         unsigned int state, int depth)
>  {
>         struct gpd_link *link =3D NULL;
> -       int ret;
> +       int ret =3D 0;
>
>         if (state =3D=3D genpd->performance_state)
>                 return 0;
> @@ -529,7 +532,7 @@ static int _genpd_set_performance_state(struct generi=
c_pm_domain *genpd,
>                 if (ret) {
>                         if (link)
>                                 goto rollback_parents_up;
> -                       return ret;
> +                       goto out;
>                 }
>         }
>
> @@ -543,15 +546,17 @@ static int _genpd_set_performance_state(struct gene=
ric_pm_domain *genpd,
>         }
>
>         genpd->performance_state =3D state;
> -       return 0;
> +       goto out;
>
>  rollback_parents_up:
>         list_for_each_entry_continue_reverse(link, &genpd->child_links, c=
hild_node)
>                 _genpd_rollback_parent_state(link, depth);
> -       return ret;
> +       goto out;
>  rollback_parents_down:
>         list_for_each_entry_continue(link, &genpd->child_links, child_nod=
e)
>                 _genpd_rollback_parent_state(link, depth);
> +out:
> +       trace_genpd_set_performance_state(dev_name(&genpd->dev), state, r=
et);
>         return ret;
>  }
>
> @@ -878,7 +883,7 @@ static int _genpd_power_on(struct generic_pm_domain *=
genpd, bool timed)
>         unsigned int state_idx =3D genpd->state_idx;
>         ktime_t time_start;
>         s64 elapsed_ns;
> -       int ret;
> +       int ret =3D 0;
>
>         /* Notify consumers that we are about to power on. */
>         ret =3D raw_notifier_call_chain_robust(&genpd->power_notifiers,
> @@ -886,7 +891,7 @@ static int _genpd_power_on(struct generic_pm_domain *=
genpd, bool timed)
>                                              GENPD_NOTIFY_OFF, NULL);
>         ret =3D notifier_to_errno(ret);
>         if (ret)
> -               return ret;
> +               goto trace;
>
>         if (!genpd->power_on)
>                 goto out;
> @@ -917,10 +922,12 @@ static int _genpd_power_on(struct generic_pm_domain=
 *genpd, bool timed)
>  out:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON,=
 NULL);
>         genpd->synced_poweroff =3D false;
> -       return 0;
> +       goto trace;
>  err:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF=
,
>                                 NULL);
> +trace:
> +       trace_genpd_power_on(dev_name(&genpd->dev), state_idx, ret);
>         return ret;
>  }
>
> @@ -929,7 +936,7 @@ static int _genpd_power_off(struct generic_pm_domain =
*genpd, bool timed)
>         unsigned int state_idx =3D genpd->state_idx;
>         ktime_t time_start;
>         s64 elapsed_ns;
> -       int ret;
> +       int ret =3D 0;
>
>         /* Notify consumers that we are about to power off. */
>         ret =3D raw_notifier_call_chain_robust(&genpd->power_notifiers,
> @@ -937,7 +944,7 @@ static int _genpd_power_off(struct generic_pm_domain =
*genpd, bool timed)
>                                              GENPD_NOTIFY_ON, NULL);
>         ret =3D notifier_to_errno(ret);
>         if (ret)
> -               return ret;
> +               goto trace;
>
>         if (!genpd->power_off)
>                 goto out;
> @@ -968,9 +975,11 @@ static int _genpd_power_off(struct generic_pm_domain=
 *genpd, bool timed)
>  out:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF=
,
>                                 NULL);
> -       return 0;
> +       goto trace;
>  busy:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON,=
 NULL);
> +trace:
> +       trace_genpd_power_off(dev_name(&genpd->dev), state_idx, ret);
>         return ret;
>  }
>
> @@ -2576,6 +2585,7 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
>                 return ret;
>
>         mutex_lock(&gpd_list_lock);
> +       trace_genpd_init(dev_name(&genpd->dev), !is_off, genpd->performan=
ce_state);
>         list_add(&genpd->gpd_list_node, &gpd_list);
>         mutex_unlock(&gpd_list_lock);
>         genpd_debug_add(genpd);
> diff --git a/include/trace/events/genpd.h b/include/trace/events/genpd.h
> new file mode 100644
> index 000000000000..2113bec56e09
> --- /dev/null
> +++ b/include/trace/events/genpd.h
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM genpd
> +
> +#if !defined(_TRACE_GENPD_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_GENPD_H
> +
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(genpd_init,
> +
> +       TP_PROTO(const char *name, bool on, unsigned int performance_stat=
e),
> +
> +       TP_ARGS(name, on, performance_state),
> +
> +       TP_STRUCT__entry(
> +               __string(name, name)
> +               __field(bool, on)
> +               __field(unsigned int, performance_state)
> +       ),
> +
> +       TP_fast_assign(
> +               __assign_str(name);
> +               __entry->on =3D on;
> +               __entry->performance_state =3D performance_state;
> +       ),
> +
> +       TP_printk("%s on=3D%d performance_state=3D%u", __get_str(name),
> +                 __entry->on, __entry->performance_state)
> +);
> +
> +/*
> + * state_idx identifies the idle state entered or exited for the power
> + * events and the requested performance state for the performance event.
> + */
> +DECLARE_EVENT_CLASS(genpd_power,
> +
> +       TP_PROTO(const char *name, unsigned int state_idx, int ret),
> +
> +       TP_ARGS(name, state_idx, ret),
> +
> +       TP_STRUCT__entry(
> +               __string(name, name)
> +               __field(unsigned int, state_idx)
> +               __field(int, ret)
> +       ),
> +
> +       TP_fast_assign(
> +               __assign_str(name);
> +               __entry->state_idx =3D state_idx;
> +               __entry->ret =3D ret;
> +       ),
> +
> +       TP_printk("%s state_idx=3D%u ret=3D%d", __get_str(name),
> +                 __entry->state_idx, __entry->ret)
> +);
> +
> +DEFINE_EVENT(genpd_power, genpd_power_on,
> +
> +       TP_PROTO(const char *name, unsigned int state_idx, int ret),
> +
> +       TP_ARGS(name, state_idx, ret)
> +);
> +
> +DEFINE_EVENT(genpd_power, genpd_power_off,
> +
> +       TP_PROTO(const char *name, unsigned int state_idx, int ret),
> +
> +       TP_ARGS(name, state_idx, ret)
> +);
> +
> +DEFINE_EVENT_PRINT(genpd_power, genpd_set_performance_state,
> +
> +       TP_PROTO(const char *name, unsigned int state_idx, int ret),
> +
> +       TP_ARGS(name, state_idx, ret),
> +
> +       TP_printk("%s state=3D%u ret=3D%d", __get_str(name),
> +                 __entry->state_idx, __entry->ret)
> +);
> +
> +#endif /* _TRACE_GENPD_H */
> +
> +/* This part must be outside protection. */
> +#include <trace/define_trace.h>
>
> ---
> base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
> change-id: 20260924-add-pmdomain-tracepoints-15254f2cd40f
>
> Best regards,
> --
>
> Abel
>
