Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523326;
	b=INegWSLSPJWNGOrBtqUqUyEIpe5IsnHJeDSmMJoT2cx0JUrdDe1EFXrlVjKbBksswOwq
	 N23eUWFAdp6gvH84pcwcvXl1MDpM78wR7oaBKeL3/LecwWS/dfMJNwzgHjhv3uQZLfYYC
	 uAJ3Z+pICvOOy158/pHZlBwlG8FVaHI4/rvjKNhB6W+Rk4I2jph/zl5z4WmqZE/pLxhq3
	 NpJPCGxgSJga7Do7pOkLEQsM9tFSFGmbAaGpyZ/6qQ3WB+SkvwF1aWPIkwjW4jSln5W97
	 7oqseoFEWpHl/0JDyL1/rxrkxxXPOjn3eoOlY94vXRJwKfbzbwcApjm5PoxKz/Yf34g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523326;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=eZhcQLcos0J5dvNvJuQcdaS5XfBtHybSILA8OS9MUy4=;
	b=X3AIjRH+vo1vOzoCfjlQNa0IZ5iT9NLBb9RRGyC8IiF7qKjJzTUeJBWgoxEZx4j4Z6pF
	 miEgV0j6+8SdynaMrEm3vgcFDgmBoVyhrtiGuBMs846HBe6gE7uap09xjNoKSjRzvgj0m
	 UkUqmGVMS1mBHufBjRGkFutA5nQ0yBuuFcW5b1tvGUQcTvZCdfSHaXu1UxZB2YsyZ3xZW
	 BWZ5zKY55j31CLe1fslfybWKROzsG9qY+g1v13IJHz6SNCCPG7Xp9RF4LPZWk8t4tieIj
	 kvdzA+o72tFwWeCb7p37Wtbfs1SC81k1tkZI+Qr2feswiZ5Gq2tW8rdJc1SAJVJVI0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mdeJc0zF;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DABE606A681
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DABE606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=mdeJc0zF
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb61185057so28978965e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 04:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795523324; x=1796128124; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZhcQLcos0J5dvNvJuQcdaS5XfBtHybSILA8OS9MUy4=;
        b=mdeJc0zFgMONR/NIr7+cJFXQYT9CzjbZVK8K5bHdLs5owNebF6BU6Lbm+9OJDMU10Y
         yt7f+5sLgqYmVZIDmBpJ4ksEtISJb/I97RIHZbwO6MvpHEzvTiAk3fxKdlhe4KnzcOzj
         ZywLle01PUQKQXASCQztj/WDuBw56a373qOxXHDEI8c2CClJsa5dYMIz6SPbcBJ6fGs6
         EE8HLW5oohacke5/5JVwZ14wuPmHOaO5S/x37gkYucadKC7fjdMmkrsfH7WTbEm7GF7b
         +sIlmr+BFFRDH+eHJlg/ADSXxq72+jMtqdO3N/xPxEpd4/V0unSmakepAaTOry33TdW2
         vypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795523324; x=1796128124;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZhcQLcos0J5dvNvJuQcdaS5XfBtHybSILA8OS9MUy4=;
        b=sn8agp1wlzruU08DFTbXtLK+2aTsDc4hYL5eL1uNGP05+EGFX4AT6bjxJvE8wO4Z+7
         MuR5yGxQ4LEr4QAeYFHoBogae0DUdJUEm0j+YpqKbjMuz4djn3v6VCOHFW4G9qwveOeL
         Dj+HMsy3GnX0INL0UyuQpuibn8wtlFuoU71QKLKlNn59eETSHdIevTRjM67ZHjgwnn/6
         oGlEce+6i98icfOmAFMsX4rr3Jmm4vsS2Ri3x9Wg/6IuIR+oVYfYaQFesayxCuUf9vdv
         iTNq5ArmLQzJbjNjIlJkO8rjzrIDWWwMfwVZFO1+7/ah5XXybLnW/7JpCUUc3rA72NPE
         ttgQ==
X-Forwarded-Encrypted: i=1; AL+hErHFd15NRwAH/NvEkt61vlkSxXYht50O+lhP+Rbxf0cTE/3LfXBHh2jvurMU638XXxg065oUMMDHm3Mbf5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+taCIH+4Knjbb5UuEW9SaIz5LgxgKmTexmikxEX/xWB+Y+xmKS
	ZH73M5vCnxmF7lqlNvquzQGJGUrZsYg+cmNsKFIZSaFhFZBDIHV4IRR6Rb6lBAFIcmk=
X-Gm-Gg: AZFdTZc8Z1VsnO4ES5aRgqMtOdfjBvPLYBe025WXgGiwfABnM8nhqUBs90MbS2MuAJF
	rlAlPFV1DUGGS3lIE8boUK8jHlMyYE64QKokplk5wrhQVPYKvYqywfjCbKzvoElm2ajmqqA1n+q
	rMydFbHftvqvGto94QMk7vq9GfupDzK+3qCNADLh0HagrH/hzzUU8YjrZ4h9FF3l3s9cGueht3J
	62fcghd7SHjX7Ndg0tbnIAbZQReiWkNHLEmB+r7PnphX/ioSgFPUoEDEOwpBqUaJtSEqIYmDadK
	nxnMspaCUzrepN/txQqnHMStFQGQgjrCdJwA6S5322Qf5wTMSA83C1e2RcWGd8pMuZ5FV6xjjqz
	bL29Lr2JHF7O0/22Ddv9lHDjt8aLr+mjKj/t/5U4/a4S5SrAW6FDzFG7vvkG+oe9Xl3D0WFZFwC
	3QV5aTTQDWMUdKaM+CdqhWNRB2jCodp2w9sZDDaR6Z7RQv6t4yUl+aKEZW0yj4yy/Rl9W3tmLyY
	Q9Plt8tlsorc/Z5IjME/tbBaSrP6H424R9NvKe3CNz1b+BiRuNK5siVo6SzB8SGV9h4qcCFfMFk
	5qXWkjEcJ82g9H7/s13kKoEL9ux+TP4/H5wtUNAzfgY=
X-Received: by 2002:a05:600c:1911:b0:4a1:7c56:d4e2 with SMTP id 5b1f17b1804b1-4bb8880cf84mr300507395e9.16.1795523323754;
        Tue, 24 Nov 2026 04:28:43 -0800 (PST)
Received: from [192.168.0.167] ([109.76.241.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm432306495e9.5.2026.11.24.04.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 04:28:43 -0800 (PST)
Message-ID: <08b9a714-278b-4e1c-81c8-59a60dba5916@linaro.org>
Date: Tue, 24 Nov 2026 12:28:42 +0000
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
Subject: Re: [PATCH 3/6] media: qcom: camss: csid-340: Report the hardware SOF
 timestamp
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
 <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
 <c7fc67a6-e15f-40df-9c0a-7eae54e99d23@linaro.org>
 <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <CAFEp6-1otVCjNJgWLTiOMQpdy1t4qJUP6_NK0CuifrN+cOTTcA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 12:20, Loic Poulain wrote:
>> On 23/11/2026 17:16, Loic Poulain wrote:
>>> +static u64 __csid_sof_timestamp(struct csid_device *csid, enum csid_iface iface)
>>> +{
>>> +     u32 lo, hi;
>>> +
>>> +     /*
>>> +      * The pair is latched on SOF rather than counting, so it can be read
>>> +      * one word at a time without tearing.
>>> +      */
>>> +     lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
>>> +     hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
>>> +
>>> +     return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
>>> +}
>>> +
>>>    static irqreturn_t csid_isr(int irq, void *dev)
>>>    {
>>>        struct csid_device *csid = dev;
>>> @@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>>>                iface_val |= status;
>>>
>>>                if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
>>> -                     csid_sof_event(csid, i, 0);
>>> +                     csid_sof_event(csid, i, __csid_sof_timestamp(csid, iface));
>>>        }
>> I think a callback in csid_sof_event() might be cleaner or some other
>> way to not have to replicate all of __csid_sof_timestamp() for each CSI
>> decoder.
> I added it as a parameter because it is provided in much the same way
> as the sequence number, given that the timestamp is directly related
> to and coupled with it. So it is not clearly obvious why the sequence
> number should be passed as a parameter while the timestamp should not.

But pretty much every hardware implementation will have to do the above 
function. I'm asking for more functional decomposition.

You could pass the hi/lo for example and make the sof_timestamp() 
function common - called once from inside of csid_sof_event()

---
bod
