Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795512656;
	b=0VhwrYk1En3M07LSoVY6vuw2XL78uQf5cxB3q5GdDaUbxc9sOxhpqgTJ+zCzsl1vjA6Y
	 I+Uo1dSqwnJPRTJWLdH7kW2tBOdOEzEmSsmXfDSeDfFPd5o7PvAOQxqiHUk1eSl0Q12io
	 ZxLqWhwTBPXCQJY0FCxAkz7SDyi9wu2zGmtKpa0Bz7ASprQ4NkwN7sTBy7tLuyXRl3k2m
	 ykpFnl4SFAiypFYxw8aDKhBADO1alIWZb5EuAOmlPyukmC098q1CTQavb4J5f/gujKnTF
	 9ibHzHHcjfzi6L0tq+UhIztnnByk0FOz1PD+yQj1wojAxqaow+6WAolwTfeQKP1yT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795512656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:From:Reply-To:Subject:To:Cc:
	 References:Content-Language:Autocrypt:Organization:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Vwz3YwCC2M/KtkN+RUWPhfgiv9vTkISGv0jzJlD7WZU=;
	b=3KSgfb4MM0KMIpNTA74aGO22hhrlksGBGPyZ/F9GC6lNrtYEh62ka/JljkhNGDsyGEKK
	 aVqESKE8nHKKEpwOzdaDEtmvEMCSMGm9whqZd4T0nAAjYowdAn9kSU6xDR64gISroXBfJ
	 +2oa3AboswDLhnCoBCv4AEAjAjW33H1HCfgIVRY1Zf40iMPLuEEgBwqBqnU73lxA0wZCM
	 pb9SlGHT5HeHK+cpScpY/FYBKYirQ8wLV9NrA73qsOr3v1Mco42IF5yfx1umeMzOCSsot
	 Xzj3zE2TJ6nTD2o+dD01ypxkLGDyGHsf4D9qpFW9XNjtfNcYDCtmUa8U/Nub9mYtfmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G20n2scp;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8978B606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 09:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8978B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G20n2scp
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso41361585e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 01:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795512654; x=1796117454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vwz3YwCC2M/KtkN+RUWPhfgiv9vTkISGv0jzJlD7WZU=;
        b=G20n2scpUNu46rHVlne7Nj0tqQWBFvFDqtFk9ztR+JfaYIfHbJlWD0PecHhGsl9hDh
         V7l64o7tUEeP9Fr0dl6utmBsMkdpxn/xAoqH5lu5GSD8eqMs3NV2wnv3FTwMp2vy26IU
         y8Fm0iVyV7oo4faPUhgk2e3vAmTnT1G/l0mAj5vrllQZzXHblRxZPyvf3hbqoxnG13gL
         6+HgxPaxvb5eBdmijrE+kGGaKzRf6SsE5QVfXNgJRzsD5IgMlCrtHA5CWCyt2ucfesnC
         yW/HdpwOYEU6CeQMCKFXNBfYkUimRkqJOrjWaLcjUfDe/X+QD/r79wutMpH+Zz2V8Zq2
         OaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795512654; x=1796117454;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vwz3YwCC2M/KtkN+RUWPhfgiv9vTkISGv0jzJlD7WZU=;
        b=Q2vpF3zYyFKiPthj5lMYwLKSnNDKugyFBb7Bmiv67XmbEaVijVXFaC9GN7NoFh+orb
         WTNZBf2joIicdkb3vbOwOL0jzHu4Ig+rPRtukxfuJYlbL2jrt95zhq/nK9Wkq5xe3UEZ
         srmJ9S/A9rvCMDECINnNHTCI8rrWtKiqJZyKzH6i6QF8tc+jjr76Aca374R9ZtD9kOIr
         GRdt6MpiaokkDrvt36RAtgNiMbR66vTav5RL8QIkHKi8viKzSXdsZMW6jj/Fbo608a/p
         uzGXASQ88Vdwd+rFfYCfJo2fVWSdwwk7X85EJpZFZ7XsNlm5rH9eOSsxsA3IYlhwYh8N
         u6Qw==
X-Forwarded-Encrypted: i=1; AL+hErH49IARxpYQj5E7E7sQ8EW5qfCFbgB5egsd2rryoz/Ch8MPzFM9iWAjTuiMw/3qsXtmuEgXp3KB19UrV6w=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Rlk2bEhiLlZvu8f36l7Ti62/GKYGWBZkeELWCUzX7gGSP5XGu
	0HBHOEhicv0s4P+8W5P7+60T25dbBaYNfk/OZ4PKGN4Nd+OJxGxP4rKVLohvptJItog=
X-Gm-Gg: AZFdTZdVUvgySu7oiHshNyiDLNj3UhGpjPNqp21vbiqZBkXvVlVuPtkDz/5qXWZfn1R
	Q+V4bkk6CYt1hGyOSOFSa3updqdxxo6UOhQ7Zc/xVbZSGfDiH+Hjr37DXnoEBHult/NLWZyPKIK
	aVya3S755mZ7TmenX2yhsSC5ZegIYwZciecT+/ZcxxTKUgTZAVgd4UTEhjn3ottB39Ps1T8d49W
	ebLOFQoXGfBHzq/3rY3pzqKX9KCJFbpaWz9oWUhz4QlVHyw0izDKs23ZoWNY/boNiH4l1S2yxuS
	vkIEuOmk1teaPZ/btQbFDB5vvS2JrPtWhEIv7mlySpXYG3QSocb7lh/Dh7tKwhbJKZmLDjlA2K1
	YtXxhOqZ6ZLlsVQA4zKw+igTocTn3vRx+1dlUeFYlLR8J67lxNPETCyyxTjcsKYMHEfaAYGvkbT
	2OCfgeRSVuRbV/aPtbaCjNA1qH3tuTX3GlNuJ43hM14VEAc3Cfv6On4cGAso/UpDJxnkkj8dv/L
	YM+G1Zdz9zeuHdFSILU+dOCiwNqOl0kryBYYGlFWDypzMNtNb0hS77+IEqrgwXpgGcEACCDMWEm
	l3DOnfAyN+F8KfwZvZc2todcWy/D/+Qbb0bj/5Gop5CUpTwH6cBIRwlE/3fiiAKdkfI7ETpUSEH
	KipWwK9hnog==
X-Received: by 2002:a05:600c:3b1d:b0:4bb:6991:2330 with SMTP id 5b1f17b1804b1-4bb8881a890mr286914585e9.22.1795512653721;
        Tue, 24 Nov 2026 01:30:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:6b5b:c2cd:5d18:e93b? ([2a01:e0a:106d:1080:6b5b:c2cd:5d18:e93b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm496080215e9.11.2026.11.24.01.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 01:30:53 -0800 (PST)
Message-ID: <3f0bf2dc-02c4-45e8-ae06-feb669b6b234@linaro.org>
Date: Tue, 24 Nov 2026 10:30:52 +0100
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
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 3/3] iio: adc: add driver for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Hennerich <Michael.Hennerich@analog.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux@analog.com
References: <20261123-topic-sm8x50-iio-max34417-adc-v7-0-d8f87edc5086@linaro.org>
 <20261123-topic-sm8x50-iio-max34417-adc-v7-3-d8f87edc5086@linaro.org>
 <awSWVMMYN2xsDH7u@ashevche-desk.local>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <awSWVMMYN2xsDH7u@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 20:39, Andy Shevchenko wrote:
> On Mon, Nov 23, 2026 at 06:47:46PM +0100, Neil Armstrong wrote:
>> The MAX34417 is a specialized current and voltage monitor used to
>> determine power consumption of portable systems. The driver support
>> getting the channels voltage, average power, accumulated average
>> power and energy over an I2C/SMBUS serial interface.
>>
>> The MAX34417 datasheet only specified on how to calculate the
>> accumulated average power, but with the Sample Per Second rate
>> we can easily get accumulated Energy in Joules.
>>
>> By default the IIO driver only supports single-shot Voltage
>> and Power sensing, but the accumulation can be enabled by
>> enabling the Energy IIO channel which then enables the
>> Continuous Accumulation Mode.
>>
>> The counter is common to all channels, so when reading a single
>> channel we will copy all accumulators to registers, so in order
>> to permit reading individual channels we must accumulate the
>> other channels in the driver when Continuous Accumulation Mode
>> is enabled.
> 
> ...
> 
>> +#define MAX34417_MIN_RSENSE_UOHM		(1 * MILLI)
>> +#define MAX34417_MAX_RSENSE_UOHM		(100 * MILLI)
>> +#define MAX34417_DEFAULT_RSENSE_UOHM		(1 * MILLI)
> 
> Oh, it's micro, but you use MILLI. Also even in macros we nowadays want to see
> the unit as defined in SI.
> 
> #define MAX34417_MIN_RSENSE_uOhm		(1 * (MICRO / MILLI))
> #define MAX34417_MAX_RSENSE_uOhm		(100 * (MICRO / MILLI))
> #define MAX34417_DEFAULT_RSENSE_uOhm		(1 * (MICRO / MILLI))
> 
> Alternatively add another patch to start Ohm multipliers in units.h
> 
> #define MICROOHM_PER_MILLIOHM		1000
> 
> I will Ack it.
> 

Hmm, I want to express the min/max/default rsense in uOhm, minimum is 1000 uOhm,
max is 100000 uOhm, so initially they were:
#define MAX34417_MIN_RSENSE	(1000)
#define MAX34417_MAX_RSENSE	(100000)

and the unit is uOhm, so how should I define them ?

with #define MICROOHM_PER_MILLIOHM		1000

#define MAX34417_MIN_RSENSE_uOhm	(1 * MICROOHM_PER_MILLIOHM)
#define MAX34417_MAX_RSENSE_uOhm	(100 * MICROOHM_PER_MILLIOHM)

?

> ...
> 
>> +struct max34417_data {
>> +	struct iio_dev *indio_dev;
> 
> Useless. You have it already available when calling the function that uses it.
> 
>> +	struct regmap *regmap;
>> +	struct mutex lock;
>> +	u32 input_correction[MAX34417_CHANNEL_COUNT];
>> +	const char *input_label[MAX34417_CHANNEL_COUNT];
>> +	s64 acc_power[MAX34417_CHANNEL_COUNT];
>> +	s64 acc_count;
>> +	bool overflow;
>> +	ktime_t last_update;
>> +	bool cam_mode;
> 
> Are the booleans protected by the same lock? If not, just group them, it closes
> the gap, if yes, group and possibly make a bitfield, then they will occupy only
> a single byte.
> 
>> +};
> 
> ...
> 
>> +static int max34417_read_energy(struct max34417_data *max34417,
>> +			       const struct iio_chan_spec *chan,
>> +			       int *val, int *val2)
>> +{
>> +	struct regmap *map = max34417->regmap;
>> +	s64 acc_power;
>> +	s64 delta_us;
>> +	int rc;
>> +
>> +	if (max34417->cam_mode && max34417->overflow)
>> +		return -EOVERFLOW;
>> +
>> +	/* Sleep up to 1msec to make sure we have a measurement cycle done */
> 
> ms or millisecond
> 
>> +	delta_us = ktime_us_delta(ktime_get(), max34417->last_update);
>> +	if (delta_us >= 0 && delta_us < (1 * USEC_PER_MSEC))
>> +		fsleep((1 * USEC_PER_MSEC) - delta_us);
>> +
>> +	/* Move the data to the SMBus registers */
>> +	rc = regmap_write(map, MAX34417_UPDATE_REG, 1);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Save the timestamp for the next read */
>> +	max34417->last_update = ktime_get();
>> +
>> +	/* Retrieve all channels to avoid missing data for other channels */
>> +	rc = max34417_save_accumulators(max34417);
>> +	if (rc)
>> +		return rc;
>> +
>> +	/* Get current channel power */
>> +	acc_power = max34417->acc_power[chan->channel];
>> +
>> +	iio_val_s64_decompose(acc_power, val, val2);
>> +
>> +	return IIO_VAL_INT_64;
>> +}
> 

