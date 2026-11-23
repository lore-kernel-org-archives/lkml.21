Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795472739;
	b=lMZyunnjphToClUdw34i75wVbfV+rQqAlUkZbmJyuAtrjcInyDBMqJkpJyRqYXk7ThQ0
	 5T5Xh1P6OsXTnfORYoakHdhaOFKu3PKIGOTWiz1Uh9Y1ejy201O5JfO5Xpx7sv+T9RQXX
	 uzfTbIU1zj71BUvHDArfI1xffoKmS+THZyb+/bwpfOgdAEB0zIBM0Dw5MQ1YkbmX+yWrS
	 o6OYiRTgkK14adjdDnRk2O9ceMX82A0iOzGpkY6IOZAK3+DzsD1GwFIiFux8FYZbxg2qM
	 SFDVl5WRP0iYr+hl7k3qWbZgpPHmFWE3T46ClF7Y2SfOvlBQGz2+i1paQpRfZ+GYB2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795472739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=O1a7RAdIgYYpZ0y9e91WZapXgmnwOdHR9E+EflWRRo4=;
	b=3avA6fvHsaW0pxYtWtZZolVXrDqNMwOlZCg8yToXnTAP1z+xgagpXkRl3MDGy5uEGtRx
	 z1AZG0wiy5/72FAGVJza19mo5jXx+GRND6w/+fvyVEXgJ/T7oRpHo3WsN/SstIVugSHW5
	 7xFJwEXR90iTkZVFJZYt02PZoNIn59fXIgN7CA+PtN1n6P41ihJ0fILiV/zBO/USK8WKD
	 Cfa5MlputRe5PdgOTvm51xIhCkow7Fkp2uAmR+q1ANB9LraLQxn+ttvrGM5iQcsyF3cGM
	 u28NCV/rmlo0ASJ9HgxHrKe51euwK5EWgQzecT48VvC/kdsNMi8UU/xkp88Vgh64zJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=6LEkh1Wz;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA14C606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA14C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=6LEkh1Wz
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-71ac798b8bbso2504040eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795472737; x=1796077537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O1a7RAdIgYYpZ0y9e91WZapXgmnwOdHR9E+EflWRRo4=;
        b=6LEkh1WzWlOSIoIIHWHHvGGe8ls6F5uMHZ1h/oA0Mfj/yUszyLlz328XQa9sRllh0p
         tVUeWXGJcqXx9ToqGSMoiqIXv1E7puZXYIJTrpse7wiOimDRxg1VWeA9864K5z7DuTPa
         iDKLedXwVP1geqUl+GNOhRu11khMsxrj3SrIfw0k2lxgSTTsR5qEBPlQsbzZzVqnOoyp
         64/NqX3sCgdpxbp7WX7Cx1QzlVVorxFLiiLf2bE72H+3UlP6o4AQCaJn0Ru4kBM/y6Iz
         /V/6jfXFmv49jLvEo9diYhTSYIrK3tnOyQodcRn6CIPXedblij46nG12w6shkcsVS0g1
         UZAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795472737; x=1796077537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O1a7RAdIgYYpZ0y9e91WZapXgmnwOdHR9E+EflWRRo4=;
        b=wf3xRCY+2oDCGQqtun2of1nIG7gfD342u3UMWqmMqQ95A1I0ZLltwvbS0mNQZvbOtD
         NZOdpX/sSu8oZIueKEMlWHPVZEqgfWNBse+rD5AFnJnN75f6rtPXeDWTxzgNVYha6ZQO
         WGLV1Shr1fng0Aic/4c9mSIkXcGpauqbwryEc6ZAV79xBp7ydbL9PshTTjUO1hu/Hscb
         sU1Sih8p1BYWqzzhV3Iaj1IJdYgdgPMCpC9wQ6q4+esxXzLlorCzId8Ki+PoeYKJr8vz
         ILrv9ZrBRx26RqrLyXy9ipJBsLDz0frS6+6eOUI5nVbSUdhNtPteYOgOfB+OtRe7WBQR
         9rKA==
X-Forwarded-Encrypted: i=1; AL+hErG826cAD020AYqhR/KKAKl9oZXMc9XA/+95vHswirQAjTip8rcSqHZPKv6TEioBFJvYg2MMtr8XBxFgTtA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/16LFosQglNXcpwrjMmZK8xhHEjbQwoMJUCjgohfE6v067I6+t
	IxRxi9Hx3V4iptNn6AWp19w0LFUlON+qEzv2B0pCN3CDez0XtKfXawrqRArVRVk5wQg=
X-Gm-Gg: AZFdTZdrMzxZG/zhi5Fyuvfy0g1ob1ZEhdD8XClIfgL99/n3XFVApn8shsZJ65epnlh
	gIT9THxmgOiCVzPGoZXlIltmnGBs802uGgGyi8opHy5iKuggZTnGkSHUxJSE35yfyN2Y2WRUX90
	LF4K1qkn2Ar6rjb9W9bbUKFiCkVaWGIPPWejgA12e3aD7gfGBF8Swr+kWTb/5Wxh63lxHYPTVxc
	5ccFwFGU0q4tiEVaVzib9AeysLGqEQER0YOgBt9sYxic7QoFdfg2FmRRY+PpcHrkcmoEbxASoNX
	AL0zhkNlYpgpIoX/xJFUpGInLq+aVREWjuDnaTiGIX4wBH9cllivNUemxSEhboBpRlZyu3ltJcI
	bWHrVDvstOhfj87aHWDiSnDKa5KAkT3mzAze4XI5TrFlg7c4oMxFfty98wp8R+VolRaYCDQMPGn
	rrajk/YSX6QxulEni5+d//bHYcsMoGGn/zqlh2w5TGGN2TxPy0ektvpMmBknTFPlc8mFPkLppW9
	isFzTMdo4EUHtXJxDBEdHDeTm2X9EUdA2shNfMvpIC28thoNS9TXzjLk8fzcvx9v3H+cC7V1VaF
	LTwG6jddTlJo3SsvbBhBfkbj7LxQ4a8j
X-Received: by 2002:a05:6820:1391:b0:71a:dd93:2974 with SMTP id 006d021491bc7-71b39039602mr10599042eaf.0.1795472737591;
        Mon, 23 Nov 2026 14:25:37 -0800 (PST)
Received: from [172.22.22.28] ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380e4a6dsm8511306eaf.13.2026.11.23.14.25.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 14:25:37 -0800 (PST)
Message-ID: <ca6115bb-1c45-408a-be55-68b74977a380@riscstar.com>
Date: Mon, 23 Nov 2026 16:25:36 -0600
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
Subject: Re: [PATCH 08/10] remoteproc: qcom: Skip unregistering uninitialised
 SSR subdevice
To: Lee Jones <lee@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Rishabh Bhatnagar <rishabhb@codeaurora.org>,
 Siddharth Gupta <sidgup@codeaurora.org>, Alex Elder <elder@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20261123172140.3547896-1-lee@kernel.org>
 <20261123172140.3547896-9-lee@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20261123172140.3547896-9-lee@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 11:20 AM, Lee Jones wrote:
> If qcom_ssr_get_subsys() fails in qcom_add_ssr_subdev(), the function
> logs an error and returns early without calling rproc_add_subdev(),
> leaving ssr->info NULL and ssr->subdev.node uninitialised.  When driver
> probe unwinds or the device is later removed, qcom_remove_ssr_subdev()
> unconditionally calls rproc_remove_subdev(), dereferencing a NULL list
> pointer in list_del().

At first I thought a failure seen in qcom_add_ssr_subdev() should
mean that qcom_remove_ssr_subdev() never gets called.  But now
I see that doesn't return any error, hence the check for a null
ssr->info pointer is necessary here.

So... this looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> Guard qcom_remove_ssr_subdev() on ssr->info being non-NULL, matching the
> GLINK and SMD subdevice teardown helpers.
> 
> Fixes: 5abfe5cf0b83 ("remoteproc: qcom: Add per subsystem SSR notification")
> Closes: https://sashiko.dev/#/bug/linux-5594c348-0c41-4482-b001-481878256d30
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>
> ---
>   drivers/remoteproc/qcom_common.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_common.c b/drivers/remoteproc/qcom_common.c
> index c53190f0c537..6fd92c33392b 100644
> --- a/drivers/remoteproc/qcom_common.c
> +++ b/drivers/remoteproc/qcom_common.c
> @@ -537,6 +537,9 @@ EXPORT_SYMBOL_GPL(qcom_add_ssr_subdev);
>    */
>   void qcom_remove_ssr_subdev(struct rproc *rproc, struct qcom_rproc_ssr *ssr)
>   {
> +	if (!ssr->info)
> +		return;
> +
>   	rproc_remove_subdev(rproc, &ssr->subdev);
>   	ssr->info = NULL;
>   }

