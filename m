Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795513699;
	b=jnq0hMpHSNZmtGiCa0vvA2JrgvL74pMUqNtdq8DkPrJs40XXzuBCMLYGZeSfsPRQYs6q
	 lDyUAMvunR1RAoqZRUSiL4eRve09rN1uVfiMg0XDTqJhN+DewP51BMra8Nm48cxitHaqf
	 IdUG7WjhCsoYICuFRZMtju+l0JMwopKrTnmEhZxUwO1OexzMwAFAN+cjYhMB6yjpv+YaD
	 TyltP+jZZdNlbGb0rOETbGyf0uD/QQD8Vg40/REzPzvvRAew7JPjk0jlVCLJKJnkWAsqG
	 qA7tJ3S8Xk+sx1ChGtnbdUgTFuy2ejBgGQWX6jT0h+CEhc1vugHzYv96zIYmBkMdD1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PYXPyQn5i+rKtffQDXwKT7j2n2EdeKt2c28XS2Q64K4=;
	b=EGDk58pXM3iScVqNBSpToNHO7ZtX2EmoU26Jqp2hHP+NcZMEG1r/LUydDfFOE8JlmKI8
	 /ur4Lo8KlKOw1+olewz0bUvLVugsA4Ng5ZTZDOcCAP8PmsqpLShrmYzgZHKkI8L9C9Xp3
	 r0RMy4fZrbg8FAGZmQQwKEIer3/LqLahRaVMb+Rii5a/+P4IrmH++MVENZF449E8odQEf
	 v7OZo3yx596vAxvfoc+r7P4k9q1hnKsUX9g4RQwfQBSVF2ZQKvfTieKioCULgf8rO+ZxN
	 ZqfWSzLlBH6PAMbmBBY0Iq4VkcOV6WAvskIWZzcviKoETtpTb5UWRYgxZN4sxoYx4jA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIDsYu9H;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="TUxq9Gq/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33781606B72E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:48:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33781606B72E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIDsYu9H;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUxq9Gq/
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8ZCT13225405
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYXPyQn5i+rKtffQDXwKT7j2n2EdeKt2c28XS2Q64K4=; b=cIDsYu9HJ9HN1b8Y
	hZKFIAXF0MFNqUwmdTocHq+Ey3Q6CZqgudQwT38Ke70o8MIoJjDUGJIFLEF8E2iI
	5gWITQ0qqy7ZrBkVx5yBtwToDWUotcZoNYxD+NTF5QxVnjtbqrOyYbcYStTSVyEj
	wXWpzHVxcm2Jy5HlmHMTfcekbHRbG2dZ8jZGVdWOgLFvlGK68l6icq92vcMGDAnW
	D6/O/PiEDBKnSvcWEf/19M0CCiuate2SqM0rCldvk9/jknznjqOFzGKk7zAaQAqI
	BcgYLh/MgFujzJr4Z39PZ5NwNjjbEH7lNk6+gvApQFodyfPAZcoTq4yQcc9aOECh
	9HsAcw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f2bsf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:48:18 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67dae919cb1so6851148d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:48:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795513697; cv=none;
        d=google.com; s=arc-20260327;
        b=mou06YttG/xHY0ukt9g4Oa8yTLQSaz3RuFSe39HdmaLR2kLKymVovoNPuLH7Ii7CPW
         eROE+0m3CuIzpxwNjRwowvw6S1ygpJ+5OD8KZ2AKl9yOgNZRn8N/sGHWiebwB7QVye/V
         yUDKNk6dEhuxR29lqyP+uw8nXns4RCNpoLX8CXRZd3zEnpu3DLyxqR53gt8KOKIVsT2s
         RJNHxEE9Hn11BuBLQaS7iHzDCLzk4Ejmg/373+Jxs2UppWcaDMjGVJUw3M783Ey9XPXq
         3y6U3FwEBhVHztNzAnM2pW933qZOX1OYNzc7NFP2ODh/OumvNSEOruXUnbP6qpXcRsxX
         KPIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PYXPyQn5i+rKtffQDXwKT7j2n2EdeKt2c28XS2Q64K4=;
        fh=CRUtsgNHtt9GbwyC6/NQ+J+ywycbYeaSQslOo8GWf2A=;
        b=gr+u3vD0uMKBII9V17oE8Syw9AW7Omvv9c3T1CgyHmQrxnbZ4MpaSXby5FdWvSSkwX
         4l0nY5UNJ2ShIYlugTFHzEBbJJZWBZMhy9aQ6pQZYeIhMekpu6APQ+nkeOjEBZAGU+f3
         YsJAFapjg+ZFWz3TDmf9eQcpV97OXYSp8VPUF7VlhddggxmgE3fw8RfQvJzyJYcqd5+F
         +vtsjMeHak40G+/dz+fUgbIFLdWu2Ji5fD+Oy73iyM+5fjyH2W+EMheuwg2DMKWdscea
         FhNQIk5ctr7Xekry1nL+9jRvcqNZ4Of2plqC8M6cFfjX9P7wLh+qLDp30KksuobLh15m
         lCyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795513697; x=1796118497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PYXPyQn5i+rKtffQDXwKT7j2n2EdeKt2c28XS2Q64K4=;
        b=TUxq9Gq/qoPpvwHq4yArYXt0E5C9a+3whK+UFzI/vDi98648+mlPWeCyB9bfkQ6yik
         OCmWGvn7NZ8e3sjT5X6r52juTWgJmrbHItVrV2gIOz2VtSODGb9G3m1bOFW5DXvKFKcr
         Py/WvYn3z9paNDqDaOBZQhrgQsQ2y09cTnx7EzjYmcbNp8kTJ2aE9G7uO9QoOss5G+DI
         Oarg/Ov+bcixUT9IqI5ToRn6gwuyjxrBXNAORjwl6Obn5RTLaFIP3h0nrE3xaN61iQ5z
         SdeKc/Rlzvb2bimcS1xm3EmNWXiEfGvCr0c6/NrKu0RqMVM3/xh7AWVwsVS9Z1YmRCuX
         uuWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513697; x=1796118497;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PYXPyQn5i+rKtffQDXwKT7j2n2EdeKt2c28XS2Q64K4=;
        b=RfZSHmgFdrUofQflwJntHVliDfnVYhVmIHXHiCngZpQN21UulGoKcFZ03NtLJF0jLq
         7cx4WIYSkjJLDndbNC1/+Mha/pl1pa6dw54hb1SDndh+WMNI+Q9nzVQVA2o9qAo+YgcJ
         cwmCD+pegMV/BXL0cGBKmk5NbexIvDojLOSyHjnHYKA0QOBAdelNKPA0I52j90Lfq0RO
         gD+tPREC7UiZHmOk2TTJUZcUvCpqIL2PdI9WZZVaK4EKTl1pg8dPcieWgVQWeEC3hQYL
         Mbh3DZc0jZMXDyub0O07CZIbc4Lm5qpkF+i3QlJfa+8uiGAC80p3nTj+yAAdlO7/lw6E
         lgdw==
X-Forwarded-Encrypted: i=1; AL+hErHdcFjbLVJydDbnQbfzAK1LymS3H0p3HWHBjuXPuL8VTSLcrPZ2JP2iUglARNTVTcOTby/jGhPKNvJWVzU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8d79fuY+S/qDd13IBf0BxjwVf0bLsN5t49GCrKzf3bPYUEeWRb
	GjwspahgmPPQjlC2swGQbfo9bSfj7a0q+kEPLFRujglXLF5rwE6eIfZZq8QdwFSYCXmXeP9wEer
	IjdYcaxzetul50Ty09ogKOeHkLMTAK9L8IKfZSqJDFxAT08ILf0EktUfRykHBNHqs78KZ3G65fz
	yGu6hhloexOTXY1QaMkI7KhmvXSAxyE/ITyd1bE/siCDeK7KcZU0qN2VYUxg==
X-Gm-Gg: AZFdTZehJjJbupvOoJ5mmL3DOK9VUJLK+JrhJO5VCBRyob8Ui9Y8S7yGL3CjU3wcVs0
	F3wR0NIrq+JQDzyhHcWjhLqvqWqvNXatbmAuHOw1GDcAge8ol1S+Z2MOC1Lzx1S0+mMaLe444aq
	9jYqdfqgMPLNe+Pcvkx1i8Q8J9lDYNnDevBlQJFPwW3D+OIMOACjIfl5ic4ei7EuPtSIK8tlX8k
	oCjk02a7y7yw6xBqHTIPpKTrDFEedN8miYRU0DK
X-Received: by 2002:a05:690e:c8e:b0:66c:e21d:9ab7 with SMTP id 956f58d0204a3-67dec41ebe8mr5944851d50.12.1795513697212;
        Tue, 24 Nov 2026 01:48:17 -0800 (PST)
X-Received: by 2002:a05:690e:c8e:b0:66c:e21d:9ab7 with SMTP id
 956f58d0204a3-67dec41ebe8mr5944846d50.12.1795513696773; Tue, 24 Nov 2026
 01:48:16 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025192555.210257-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20261025192555.210257-1-christian.koever-draxl@student.uibk.ac.at>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 10:48:06 +0100
X-Gm-Features: Aa3M54rCeSWPLabRKxpMyY7xQTHa_5h3mdus28HWlTKKE_dLD7QlkdvZ8TUkSI0
Message-ID: <CAGgiveVtFW=t15nosGVtQ79Gr5jiWTAP3U9Wc5LCfV3Rr=fehQ@mail.gmail.com>
Subject: Re: [RFC PATCH] tee: optee: allow forcing the reserved shared memory pool
To: christian.koever-draxl@student.uibk.ac.at
Cc: jenswi@kernel.org, sumit.garg@kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?B?Q2hyaXN0aWFuIFN0ZWZhbiBLw7Z2w6lyLURyYXhs?= <ckoever@outlook.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzNyBTYWx0ZWRfX96XM5ym9nXpI
 kMmLDorSHtdNEtoUhkjPElcpdPUgPuB49VoEKAIJ5vN5DuFUKHpi/mUR3eH5EmZEEAWogpIYE/S
 lTFKaM5tBYB/37ICOG3Y8Ax20VCQWG4=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b055d62 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=HrFImSkvvj_0lBCYv5gA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: jT1qGkLkBtOCD9kpT0TisVvqaSn2-Bb2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzNyBTYWx0ZWRfX2JnzR0GC5krl
 fixDkmrqk5ptoN2/+xkacgVQxrOpp4JfV10ttSh1JRxjrDB/9ec+Dy4A9ABbn0Nkp0ivLUWzGvk
 GIFCGtEcq/RXreaehDYbe54nTPiVFiNoAPjQgup3BARqO0l8WcYu4eKU8RLhrNQRQutEwgoDNAD
 C9xk9xGo/01Q461OKYrZLbw7YgRjXghPknPPsvaEXmEUEzevmAK8uQDxcSHI43UVi6H0+5zXxBg
 h75cy/aYKyX/ikfmkcLVox6VCWb7ilUI03l9c6CjKdWWg8rvemDXZuBnnBKR9zAK2q0kALgxURT
 qLaMyCc0YQphMGIpcOZrAu7dic+hXQwgsz8Cy+O83ugJ7LlhsQCQhreHgDs+0EiMfVAfWTVfHSV
 TTReQZHeszb2O4gyRY2SaIvW/ydOP4ONHbiogbK9xYN0UG7biHqr6J71ZELjaVv3RK0/HdXIbde
 0YkCBk5C4BERpyVTcEg==
X-Proofpoint-ORIG-GUID: jT1qGkLkBtOCD9kpT0TisVvqaSn2-Bb2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240037

Hi,

On Sun, Oct 25, 2026 at 8:26=E2=80=AFPM
<christian.koever-draxl@student.uibk.ac.at> wrote:
>
> From: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de>
>
> The X98Q's vendor BL32 runs OP-TEE 3.8 and reports sec_caps 0x5, that is
> HAVE_RESERVED_SHM | DYNAMIC_SHM, with neither UNREGISTERED_SHM nor
> RPC_ARG.
>
> For that combination optee_probe() picks the dynamic pool and sets
> OPTEE_SHM_ARG_ALLOC_PRIV, so every message argument is an unregistered
> private page passed to secure world by physical address via
> OPTEE_SMC_CALL_WITH_ARG. This OP-TEE will not accept that: every call
> comes back OPTEE_SMC_RETURN_EBADADDR (4), which optee_open_session()
> converts into TEEC_ERROR_COMMUNICATION / TEEC_ORIGIN_COMMS. The result
> is that no session can be opened at all - not to the Amlogic firmware
> loading PTA the video decoder needs, and not to any built-in PTA either.
>
> Registering memory works fine, and HAVE_RESERVED_SHM is set, so the
> existing static pool path is usable. Add optee.no_dyn_shm to select it.
> With the reserved pool the device enumeration PTA opens cleanly and the
> system PTA answers with its own ACCESS_DENIED, so the ABI is healthy.
>
> The driver arguably should not use unregistered arguments unless secure
> world advertised UNREGISTERED_SHM; a parameter keeps the change local
> until that is confirmed upstream.
>
> Signed-off-by: Christian Stefan K=C3=B6v=C3=A9r-Draxl <ckoever@outlook.de=
>
> ---
> Tool use (Documentation/process/generated-content.rst):
> This work was done with the help of an AI coding assistant, Claude
> (Anthropic), used through Claude Code over many sessions. It did a large
> part of the hands-on work: it read the vendor kernel and the firmware
> interfaces, probed registers on the board, drafted the code and the
> changelogs, and ran the builds, checkpatch, dt_binding_check and the
> tests on the hardware. I directed the work, reviewed every change and
> the final patches, and take responsibility for them. There is no single
> prompt to quote; the sessions were of the form "find out why X fails on
> this board, fix it, test it on the box".
>
> Tested on an Amediatech X98Q TV box (Amlogic S905W2, S4 family, 2 GiB),
> vendor U-Boot and BL31/OP-TEE, Linux 7.3 plus this work.
>
>  drivers/tee/optee/smc_abi.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
> index 51624443359b..1824aead78a6 100644
> --- a/drivers/tee/optee/smc_abi.c
> +++ b/drivers/tee/optee/smc_abi.c
> @@ -34,6 +34,11 @@
>  #define CREATE_TRACE_POINTS
>  #include "optee_trace.h"
>
> +static bool optee_no_dyn_shm;
> +module_param_named(no_dyn_shm, optee_no_dyn_shm, bool, 0444);
> +MODULE_PARM_DESC(no_dyn_shm,
> +                "Ignore the secure world's dynamic shared memory capabil=
ity and use the reserved pool instead");
> +
>  /*
>   * This file implement the SMC ABI used when communicating with secure w=
orld
>   * OP-TEE OS via raw SMCs.
> @@ -1770,7 +1775,7 @@ static int optee_probe(struct platform_device *pdev=
)
>         /*
>          * Try to use dynamic shared memory if possible
>          */
> -       if (sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_SHM) {
> +       if ((sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_SHM) && !optee_no_dyn_s=
hm) {
>                 /*
>                  * If we have OPTEE_SMC_SEC_CAP_RPC_ARG we can ask
>                  * optee_get_msg_arg() to pre-register (by having
>
> base-commit: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614

This appears to be a broken downstream implementation of that
interface. Could the downstream OP-TEE implementation be fixed instead
of adding an upstream Linux parameter to work around it?

Cheers,
Jens
