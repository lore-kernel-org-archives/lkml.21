Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600677;
	b=uilm48KHS173CubGLbyYw3eUdhmdunhbBVpw+HtD6Ew3fzL8pFkntPBfVLLJrw7de0l2
	 OdHfyflUgCVP0oG7jknwbHgtT8MmNDnPAqDkiRSYATz/hcZQxeCP6wmqXvh4ZcB/9UJip
	 Na7k/HPsDvOMH4j0rMNrLKvIayENZhdd39M0uHqrXT08g012+rqSFcdqyi/7UtOtyKjWd
	 1UGnD8vyJ2bJtT0qG94+hB6ObundQjHzj3CttcbeGfojD9lnbUEEs9VGkfHZtVr47eSSA
	 RPN93bGLqAc8nNWPHnerwL2lZtIzn2mH/Su5Lam2/t2iwEqJEbM72P6QiWGu59WK1Tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=k6KEcTl/pyiQsKyyg/2eQ+l+POB59ejsRYmW+NNyeA8=;
	b=xakHUUz6ougpPhgvUrXDWLWwRF2kisqZkSPCrHC9my7OjvFuWiTdzL2lEN3MKKP5MOAh
	 eXwEzQZ//6qvEdZAU+kDcqgLyBMadSi/UUV6ncUM1dO0E9A8Yhb0jAtPE48TB5a5TSfcA
	 BxFcITSqyhgMDrAFrsHDRfT037TSJoj0Wv/b4gut1xdG+ySgUnFbZ1rtfXHsEqhygF6on
	 EpdbSy/VX+j2x4z2P4T/klXggcU9dHjBOUNzvXULfGn+G7grMF8x2o8D9Lb8qav0qAQkf
	 8V7JLrawCcTty8UtKOiptbINcrEAQoxLAsCHzPKSCtsusByk7EpMCGU+2AO621Gf57g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U4ho5SIW;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675FF606A321
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 675FF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U4ho5SIW
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a34ffd3e39so3013538f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 01:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795600676; x=1796205476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6KEcTl/pyiQsKyyg/2eQ+l+POB59ejsRYmW+NNyeA8=;
        b=U4ho5SIWBLfAJh6L5LxddeznA40KG8rNkgKkmJbUOGnKML97JS7z0daSK34Zyvnr9Z
         emW4BnhTJPTGzn7MDO/XQ6XFuGAkn8PqfR9lmVM0j/npQJm39KhqnCc5mQozsg9zFA+k
         nTSmV7GBL+NT8vrX+Pa7YX6Ru7xTGU3qM4CTFBA8YOieDt6N4g/1BiI6yxOrWS2aEow8
         FD4gXsInN6ZPK2FqjU/gAVh5kZCCcJGd27RWkC3rnlR+1ThU7hUb+s02kJRgG7hQmeZ7
         re6IrPGN9TT1ywerZEdUzP/LM47cfXwtQjFH72RWIUB23Wx/B17BIfb9f+7Dj7GSHpJO
         SiKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600676; x=1796205476;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6KEcTl/pyiQsKyyg/2eQ+l+POB59ejsRYmW+NNyeA8=;
        b=gKk0WiNFIeDA6vIpY6yUktEf5/ZJQcddKKi8xG64qIdUdh83vr/0B2q4YfeQPKqLjX
         vZUNfmzNfTkR7J5wUx8TK8Zjqedzvipwp/O/kYp9vOnHweeBHydimXMXBYvYGB5NaoHi
         xjFtjxK+Gp+hjfu/KzE0nNEsnuazJWrjBJF54k0V4uYOv6Ds+NV2CX9d+4msi1gyRDLp
         Mn3LSgj6h+/RcvwVrpnX8w6VWjHvU+AYlP+KgtLr4p1UZBmEANWWFNT8vWyXRVj4tcpV
         CeMjuvwJxRFkzYd+lCUBucFXfo0L9NncliswWhPgbHPF8GC5cArgAja4EcmFf+i4SMbf
         JqKA==
X-Forwarded-Encrypted: i=1; AL+hErF6xSJxOO3FF2oBQdX6uB30FVlr8xTMyWK5PdOkMNNurrrX2LgX38UTCZXcBxO9euI8pYQBQ98MPN+LkdA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/gplocMoZXOcaTCIkg+b5ygD4lE+2Urpr2fX8RR7wwv9+AfcDr
	WrzyffR5qYBfbcKXDHSv4G2RrshQyOXBeAK3qKDS/1fXFPOrFsNhKLMBg6aMRvulPME=
X-Gm-Gg: AZFdTZeK4B5sMGNZNDinCxKe5FBdAJG8GBYK2p5a9wZCT3QbJP1FQiqoM3ROdzXhD5Z
	zUGSMJD6JJ6GWGWre/bl5xzzN0AzuCIfMM4SVTCbozZ7wIyu7Zs7gmm3IBeQlilMzwPMZq7Txep
	6mulK8PY4KtTuBXttAogHNNdD4qDEfpLJWhQsCQsugWAbkb0rKNpJrAdCmSxfltkjE7+GbA2UXz
	v6pFnA/o5N/jbLzr/gIQqWzGmyhWljZH9Q3J/SnEsehsFhPoW0oy78bSSXB60jVo55GIB6MtpXN
	tmhI2o4asrgNqi8b81LcCC0lBKtM5RWqkn74EBEtvqP+rOf0xezNtK4zM50RSy29P6fL9LK2SMw
	/IHdsDGed0xbULJEkqGTDqjSGy8KbLMB9v3haDF5abAIIq/g2PiFZiy2P9X0+q+Ck9tCXvtcZPi
	6ZuWYPXRWw07zTjX3Ntj3RRVGep2xV96KbSyL8VQwn8N7Yjvf9nGHdfW+OozimoNjvWFiI6eyzP
	K6rpnWIPlKeK/ijt1HOMcBTf29kPG56OzSS0qlCa/K/v4zs9K9e7qOn5gNl80aCITm6snk23oM2
	iBu7UpbiiE0xgVHJIoW+H4Su+LT7kDuHVg==
X-Received: by 2002:a5d:64c9:0:b0:488:88ec:59c3 with SMTP id ffacd0b85a97d-4abb0f3c071mr35368426f8f.14.1795600675654;
        Wed, 25 Nov 2026 01:57:55 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm32730070f8f.10.2026.11.25.01.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:57:55 -0800 (PST)
Message-ID: <d2ae7970-63cb-4c8a-8c04-483d88fcbffb@linaro.org>
Date: Wed, 25 Nov 2026 09:57:53 +0000
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
Subject: Re: [PATCH v4 15/19] perf auxtrace: cs-etm: Capture wrapped snapshots
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>,
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org,
 linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>, linux-doc@vger.kernel.org,
 John Garry <john.garry@linux.dev>, Leo Yan <leo.yan@linux.dev>
References: <20261105-james-cs-unformatted-per-thread-fix-v4-0-7759e0ce2449@linaro.org>
 <20261105-james-cs-unformatted-per-thread-fix-v4-15-7759e0ce2449@linaro.org>
 <8b37f5ea-9427-43f6-8abf-07a36a9bbb72@intel.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <8b37f5ea-9427-43f6-8abf-07a36a9bbb72@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/11/2026 20:41, Adrian Hunter wrote:
> On 05/11/2026 13:45, James Clark wrote:
>> find_snapshot() isn't implemented for Coresight, so when a wrap occurs
>> we only save from offset 0 to current head, modulo buffer size, rather
>> than capturing the whole buffer. Coresight drivers currently use a
>> monotonic head pointer even in snapshot mode, which gives a lot more
>> information for taking snapshots than a wrapped pointer. It means we
>> don't need to search for data at the end of the buffer to guess if a
>> wrap has occurred, and we can go back to saving partial buffers after a
>> wrap by checking if the next size to take is less than the buffer
>> size.
>>
>> The drivers will always be able to generate a monotonic head because
>> TRBE has a bytes written counter, so even if we stop generating an AUX
>> record on every overflow, we can check if the counter indicated an
>> overwrite and offset head by a whole buffer size if it wrapped. This
>> forces userspace to read the whole buffer rather than between last and
>> current head. ETR and other sinks use software double buffering, so can
>> continue as they are.
>>
>> Add auxtrace_record__monotonic_find_snapshot() and use it for Coresight.
>> A monotonic head can't be auto-detected in the default find_snapshot()
>> by checking if head > buffer size, because before the first wrap a
>> monotonic head looks the same as a wrapped one. The search would then
>> falsely detect a wrap when head is near the end of the buffer, and the
>> wrapped pointer fixup moves 'old' and 'head' a whole buffer ahead of the
>> driver's head. With a wrapped head that doesn't matter because only the
>> offset within the buffer is used, but with a monotonic head the next
>> snapshot would either save already saved data again or drop up to a
>> buffer's worth of new data.
>>
>> Reviewed-by: Leo Yan <leo.yan@arm.com>
>> Tested-by: Leo Yan <leo.yan@arm.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
> 
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>
> 

Thanks!

