Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795714329;
	b=GNdBBUBG034w/qZnukl8K/LffM7A/E0sOeDs1yCY55uz4hX5Vf8094zZrGyMt7qdMWVK
	 WjnlI6pdZ2XV4nkcfdneyl8ynPLfU2s1YGVit8JZlyUfOHz8aEPoaP6Zmpafa50C+UyL4
	 zd0ydjrM6e08zOc1wG1rPM/uoQ/X7TGaVPDN8ozPJou7MivWUBlPgaRSjX2qDnlN6FF00
	 Ji2v9G/ylCxTlx6NtB8NNSGcCT9jt6VsBOg4o5pOS4gCMCy7uqMVC/x/NFxl5yHqS19+p
	 hoJOzOxcwKaIGQnPkoqKJiwbHuJggOGIbSE63e7M05W367tMKqJSH4Zz+AboJ6Rwi8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
	b=CYVET1PhG7mtRBt5OFhAaVNhZYVbUCajzHMAuAESlwrEyd2oWfkE6LqwxCwlebaA7SkC
	 Y3eJOfr42jdH5n5GtLcq15Z73X97OTmtV2rqy9SgMlScoZGvmo4Rl9UMof0I8k5UCpe6q
	 y2ld18k45LCvG4101RnyRseUdCztlA51qIF6ZXNeIa119hwxo2W8ahaw8dsXAvORrFt0G
	 1IZbyUJbgYFii6z8hu6f+XwI2mUW7IOR97DNlwD54ZPngmqQy2DvbIhlAkMevonR7O68d
	 src3xTrSlNrocnJ9Qk3hnfuc5+OQgatyyIsuN9zVkAghOepnX9slXCjtnavMVJ2zfTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHGHk5DX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nje3F+ca;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEF4606A321
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BEF4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aHGHk5DX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nje3F+ca
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu7LC2068320
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:32:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=; b=aHGHk5DXdGm+xSDp
	t9TtYweyTDwg7nx+aw8ZFt/A4TBw9qeDCgg+Rk1EhOv9JC7WmZcHw3uq7TzB8mJ1
	ySLjoKw0s8ibVxnjV0bumOY700ksROzumX2dHR3cpsSUiE4Ch8cdI6f7JoI235XT
	b+5UtH+1SX2LIgkSMAp0tSDr+R7ZoxwuqArXrfd5gse8yfQX7bSHGuTSPHQzzw+F
	yW+Klx6DzA/g8vB5ubtG4OAtK/1cL56WROPjCuRzMYk7eEnyViM4Pzp48ro7efxr
	E+T4MT7EK8lLFLnCKG8yp45V4/2ZLyXupCkWuRhPo62UdBiTwY/DU/h2elj6x2BP
	f5SPqA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y43bd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 17:32:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8b930598cf0so12584896b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795714327; x=1796319127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
        b=Nje3F+cacqnvCTzctixs8NCEWVijYbfMviH/izKO/RFLP/w6t0jppyy1IkPx5V+W2Q
         BGI8lI4L5Me/gxuewA2OxJI7Ey1w4OLOFlPqnagnPRjy2zXZa7Z+2omKkc+dGLO+HAiI
         GW1heMbKXC6X8lNSw92j05BAn9/yHuUEeFs+zwLujtuWCWleiiOkMHP0HicKSKWtB9lc
         8Rcd8foAhed1jYwThxYGRd3xRHsuHHmYZhq1a4WoroyPXWKbqE0YHQdjaLs+sciXz9qM
         EVCDReeT3EiuIMVUT0o4lxbjfvbEGETXt2q7x+Xf4Xbv/O//NeOxPPpvYdzy90Nt2Usj
         dk8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714327; x=1796319127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2AzNlbcPcmYq2Ra9QbclJc9P33LkY7WUFjrph4pVnQQ=;
        b=UuRcr2yWNY3Xw/d0hCiQLGfVzTJfg3msH9ruSXqKicEkoYNax2lWiXQgtYVsqvCoO+
         hTFH/b5gkwrTvQkt7k0Ay1QqIxJ0ADZu+y2vnLgyCfIrbtEU0UPZ48TfaUfOELpqlxGS
         MNgxBaSDYPloZLn8yWTK4rIsZUVQrvOdx69+w8V4oynEB7+OHY2AQKs9UK1JvCaAzqWo
         0FTaDHob+AREPGOhFL1p5vzBuK9aEl3gqOlAviOa6muwQWRKViWnhf+QogpqN7UoEvDV
         Btw4G+PzbdWfBbG03GLATPorrtuyz6rLyomfJCF8bfFH2iARZ0Vazbadm9E2/XRbN/jQ
         yQ0Q==
X-Forwarded-Encrypted: i=1; AL+hErHWcje6KbEODRIhCDxSTgJARMJmszJkuOtWBiSTvoI67zbr5Nkg4I+T2CnsfbwimyMIWTwg2c1izslEh5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fS0Eq1EOrVeS7qTnYHDrNBCAWlZSI7fFuaCl+3MK+DZ6njriD
	4lB+OvbdRoWOdat2lGtkaX0zvIt/YnD6W2DyCgBAApV8plvQAl7zUAcL4SbHCZD855btAEBuxWH
	i+Pcd4R0yE0cKfsBN0AGKn9Ty6J2VtGf8nHX3JIrht9FvXLCJ7xRPpfaBxgArzfIvUd4=
X-Gm-Gg: AZFdTZeJIXiW2iBIYfl8/w1BzfCKCAwzudRzfu5y1PoazF1tonIbB/zrrDOSunRXx22
	qqiK0JF6JGf+4n+9J+NaicXZK/UaCYXLmB/qcZ1UgGZNpnXJm9eE7oNL+elhgPQH6slP1vuWfM6
	dNnNQ/x7yJDzdsimp5Dy2G0ziyRwQpPfiJGHqseYiACmrcT11GYdUE/OUF+0tKzM8T+dgLFdIgi
	TYJBkcz3zaAC8d3mEr7Ohe0/Dgwf2NwJeoUklZjRGUlM83a4R8vg/7h9ELGixmVwYkgO8Nh1uJq
	FaVjXqk9+HcFS4xZj05MyvKPaz+7r8P87MwTUSG10/m0HN35jXRzdH3kDlAQJX7QxWRsulCkFwi
	KwK8KNynEEHj5Ad5JNy74Yrv2JXHhinX2gglwQZj+DspNlhMwFFGdyoUztw20DdLMBYD4A2apQc
	jhmIbGPP1aLOgNjDgtFDudLdXDajDk04mBcGJchKGF
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr24967831637.48.1795714326862;
        Thu, 26 Nov 2026 09:32:06 -0800 (PST)
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr24967805637.48.1795714326388;
        Thu, 26 Nov 2026 09:32:06 -0800 (PST)
Received: from [192.168.1.8] ([122.177.242.156])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm7776293b3a.25.2026.11.26.09.32.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 09:32:05 -0800 (PST)
Message-ID: <3c1b3957-3ce6-4109-8465-246d87e408f9@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 23:01:59 +0530
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
Subject: Re: [PATCH v5 03/11] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
To: Faisal Hassan <faisal.hassan@oss.qualcomm.com>, Thinh.Nguyen@synopsys.com,
        gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        peter.chen@oss.qualcomm.com, krzysztof.kozlowski@oss.qualcomm.com
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
 <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20261123104727.1539149-4-faisal.hassan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfX97H+jnkcrtWL
 FKmFfanA/zkN0en2WUoyETV82TDnnKMXIar9WgH9cH4crTbwJPtfBWW4bUjb+Z31z89LIwbaZVj
 +bkMLRDPwsAOJB9gMSKZeE6yVX193lfMbzkwo2BTAj8TVWXuuJYRMh66VnmhOdKUJyiCYBvrpNJ
 B8Bof2+zpiZS+THQTwFjz7APRsXnJcv9mS6FWIerohrF3IHOcEBTZycOW59+YHbPQ8IHqlrNc9e
 KD6b5BMWVH/suqJ2ueH1VGN1D0cOOFmn5OWUPS6o5jUju4CV09hf5D0NLadvAnCF4d+M+vLjzKj
 BQi/by2Wa7Qvud2eiLQ9FMjEMnLOyfiXhdcf5yAy9a3Uud9wTTn6CQjHZtbS7lZglBSqFvEEdv6
 njlwQ2u2gnRoxpP1bQPXVsBcoSU/rPATB0R25sCa05gnJ8Vdghs0C0/eXa69zdog1Eb9MM/DMoS
 RnOGNR1d9MntmMROqWA==
X-Proofpoint-GUID: H4uy9xIX3oe57UCX8MASbpo6kOYyoyZW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2OCBTYWx0ZWRfXzrLZGhqeWgUC
 iIxKo8ikqhKPUIVRf1SYrinYUqBpuFVmqPWvq/w0Pct3lxDBNnu/Zd9MxMoxLjsQskUeXvEdZaL
 NlZk6P2rr+UGavSPFL9eBYGoNqjRlbs=
X-Proofpoint-ORIG-GUID: H4uy9xIX3oe57UCX8MASbpo6kOYyoyZW
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b086d17 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=EbDk/eETi6Q6sYbTlnF7GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zjTcfuHnCzxvNZJ2CccA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260068



On 11/23/2026 4:17 PM, Faisal Hassan wrote:
> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
> clocks. If clk_bulk_prepare_enable() fails, it returns with them
> disabled. The next suspend returns early on is_suspended without
> re-enabling them, and the next resume disables them again, so every
> failed resume leaves the disable depth one level deeper and host-mode
> wakeup is lost for good.
> 
> Re-enabling them on the error path is not safe either: the
> level-triggered ss_phy interrupt can stay asserted, and the handler
> can't make progress while the controller is not resumed, so it would
> fire continuously.
> 
> Track whether the wakeup interrupts are armed and make enabling and
> disabling them idempotent. A failed resume now leaves them disarmed and
> balanced, and the next suspend arms them again.
> 
> Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>

Reviewed-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Regards,
Krishna,

> ---
>   drivers/usb/dwc3/dwc3-qcom.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 18db19cf2065..e7fadad9a4e1 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -81,6 +81,7 @@ struct dwc3_qcom {
>   	enum usb_dr_mode	mode;
>   	bool			is_suspended;
>   	bool			pm_suspended;
> +	bool			wakeup_irqs_armed;
>   	struct icc_path		*icc_path_ddr;
>   	struct icc_path		*icc_path_apps;
>   
> @@ -323,16 +324,26 @@ static void dwc3_qcom_disable_interrupts(struct dwc3_qcom *qcom)
>   {
>   	int i;
>   
> +	if (!qcom->wakeup_irqs_armed)
> +		return;
> +
>   	for (i = 0; i < qcom->num_ports; i++)
>   		dwc3_qcom_disable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = false;
>   }
>   
>   static void dwc3_qcom_enable_interrupts(struct dwc3_qcom *qcom)
>   {
>   	int i;
>   
> +	if (qcom->wakeup_irqs_armed)
> +		return;
> +
>   	for (i = 0; i < qcom->num_ports; i++)
>   		dwc3_qcom_enable_port_interrupts(&qcom->ports[i]);
> +
> +	qcom->wakeup_irqs_armed = true;
>   }
>   
>   /*
> @@ -396,6 +407,11 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, pm_message_t msg)
>   	if (!qcom->is_suspended)
>   		return 0;
>   
> +	/*
> +	 * If a later step fails, the wakeup interrupts stay disarmed, as a
> +	 * level-triggered wakeup line could otherwise keep firing while the
> +	 * controller can't be resumed.
> +	 */
>   	if (dwc3_qcom_is_host(qcom) && wakeup)
>   		dwc3_qcom_disable_interrupts(qcom);
>   

