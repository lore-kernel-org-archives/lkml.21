Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425552;
	b=MOItS0xlGKXOAUvD/hvt1Flvg7Zg/X2ZmuHYLbFwmqbhs/ykNHVxeRggakrqhCSGngal
	 26KJ8wzHynRTuPSiqiTuynFewcHrd/d7Ut/Rp45+TtScrCjdBb8jjWghpoKNyp5p6ljYz
	 HfZnRaY2At0bzBy3XA8jzfhMyvdvZz/Q6H4qwFmdnLH+pdMqAeR6gkCGmwSrKXijKbfJB
	 xhGzNemAdtXArXm775Gh85e0olSNbVNIZNpIp3UdkJgdUmajpmRJuMKOaE8qAwtbHOJiy
	 MzEzLp/ZPHllwnLh6X3/C+sijFX/nAY6mJ/xFEAuR0FSF3uX8NPoIuJuYLqv0ljWqag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sAmqFpYWgjvb8G8xwJ3EyQTOMxtxvWPqiczFCJd978E=;
	b=Mr3wmctODfaXFYzYbkpj4xOzff0n95QVQjoJy5T1eEtTC2dQ0yPLS/CHsM4axpNbhUNB
	 OKXEWI+Wd8UEUtBGcHoevl97RonwhW3A3dfI/eo/hsf191+NT4dngoS2NiSMkq0aGj3Kg
	 3G8dw/+VUN72BLuDEQStn5kE3iF6VCcQ1aadnKUK350PU40kzRlTwgLaOmnU1Qikvrh2C
	 cfRrDt8kAZQC7XNlBBVmp1DfDAgEz2NR4HuSSFDQhT6SOuL8j88rwjtahk3HQN93CfxTT
	 uv8LP6AAywENIvAFLdskNA0UHCW1QVRHejFEkUOhI5NinGFVRx2FyUADLSO52NV+gyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aLYgqIqO;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4042B606A321
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 09:19:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4042B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aLYgqIqO
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso1704642f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 01:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795425550; x=1796030350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sAmqFpYWgjvb8G8xwJ3EyQTOMxtxvWPqiczFCJd978E=;
        b=aLYgqIqOlheI21nSFruPrybRyAxWQK7ED+fJlrli6T/LVj62UMse1MLF6+11EUrM/A
         5eDVZ6996LDJVUWN8t8/Dm2q0KTYUDv16Ej22VzeYkii835IVy5u8MPxw3I4LKz7BuVJ
         ZZTLl6CPuD3myzniwZ8AEPTvDe3gTHA1i9OCDKbi44OhiQK76Y7cgVfRHIyWV976Rsbu
         N99bZGzRPBKvh0ov7g50xkvhi108IuPeJp7XmScSqEZWB1GSxMqfZCDAt0Uryel+LpZh
         j+l+zxahWhmRp4+Q3wx7CgNawnVC4lfTxRdbSPm41nsN0m2BTT69RXGjns16maQDvpXJ
         uZ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795425550; x=1796030350;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sAmqFpYWgjvb8G8xwJ3EyQTOMxtxvWPqiczFCJd978E=;
        b=b9E7wLbJ6lZhJftgpPBkNoRH5+TZQgVQE6TdE9I6as0TrokyD1degPlqe6fUAct370
         K5wy/+L4GMd9QddHhivlrL1J0VhRUSni0O64IS6hxVDkyhRA/RO8xmgwf8tE314A/Q5s
         xHt/oPTRFmKLFDHwXFL60WRCRO0++n9KoF99ayAcsRiPOir43DaY6AHp+SmuM+UGs0cK
         BvecivdN90kLP0wF0bKKGAIWcYlupMfKhGgMvcE+OiyOI8BcR+iZ+qrYNumQAdQtxZxK
         nMsdVXIzY0OKnVZ0yO805BoIyimX+Hbv+mbdVnHfSzs61PD9OvkxZpnYfFD1aI1wAz7P
         V9Ew==
X-Forwarded-Encrypted: i=1; AL+hErHE4+Oc9rm9ubFqNMzQdP3FXq/1jHZ92LgFzN7v0xmcqJjwptY2M4xRYdKky84gh50SlaBfDt6uVyyi9yk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MEQMmNpH08+GQ5TyrF8XsQ7rv4XSV37UDFImGbiAYq8038soR
	a/50B4zdLwK8XzucuRovhhONX3uvt0mRWbCJsH+FALcz7gWAYIhXOHmpiOkog1Exf+A=
X-Gm-Gg: AZFdTZc+TRL4GMajT3XiEC3UyahLsuHxxeXqFofoyZmQUFCu0iQrfXE5O1ho31S6ka9
	RR0YIV/ENasCS1msZPWNjEF64faTikjru8vu8kibvT7BgX4D+yu6ev0Pc42P94OZWwBSelb5oGY
	On8oTfKwAvRQLhqLSOQaFncLlu1dvhI/aSDOihVn8tWILNnFDZEvfKTlZGaRYbsEDO9V71MzSWH
	xbK+nVcvIzjojfIbpwFR8FjWneNEPbBUQE9WkKmZTagcwscQwcb9yb9DIci4sK0+rOSpBwQYuBB
	0fDwqP0UTJrvUFO3MqqQyt9xlOx6vEDa2wUouYzPjJWxaWHOYwo0AfbXOei2JSs0Y1gGwLr2dnQ
	zxkNz9JFeU75RM5AKGsh0J+e6B2tWmGUAvdes7ChPulMkv2il/T2gIg4olAylmQOci9N4ZJ9VOy
	uv+nskLHWOLhmQH2Y1OBbk6lnlY9kKKdoO8DKfmQKy0ncT6aO2twwon2KvpMFuM56kOksGjmlcv
	2B6beD/AgVrtf1ABBDgD5pMVLDcuOJGR28+qUgngCDSfiVkRL3vZP4OzdrK3q3NTQPQdeiXmwlU
	iVoy02J4q7Jl6h0rrEj33GHod6VUrOqQBQ==
X-Received: by 2002:a5d:4452:0:b0:48e:3767:d885 with SMTP id ffacd0b85a97d-4abb5bcd524mr16582999f8f.53.1795425550512;
        Mon, 23 Nov 2026 01:19:10 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm23805806f8f.14.2026.11.23.01.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 01:19:10 -0800 (PST)
Message-ID: <31480f0d-112e-40c0-91fd-8f9c998651f5@linaro.org>
Date: Mon, 23 Nov 2026 09:19:08 +0000
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
Subject: Re: [PATCH 0/3] perf vendor events: Fix misspellings in event and
 metric descriptions
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Ian Rogers <irogers@google.com>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>
References: <20261120175840.1274637-1-takano32@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261120175840.1274637-1-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/11/2026 17:58, TAKANO Mitsuhiro wrote:
> The PMU event descriptions shipped in the JSON tables under
> tools/perf/pmu-events/arch/ are printed by `perf list` (BriefDescription)
> and `perf list -v` (PublicDescription) as they are written, and the metric
> descriptions in the metrics JSON files are printed by `perf list metric`.
> A number of them carry misspelled words, so the misspellings reach the
> user.  This series fixes the first batch of them, which a spell-check pass
> over the power8, power9 and power10 tables and over the Intel and AMD
> tables turned up.
> 
> The three patches are split by vendor because that is the convention for
> the subject prefix in this tree.  Of the 989 commits that touch
> tools/perf/pmu-events/arch/ as of 65e4fd942f72, `perf vendor events
> intel:` has 391, `amd:` 37, `powerpc:` 8, `arm64:` 83, `s390:` 18 and
> `riscv:` 13.  No commit with a vendor prefix touches another vendor's
> tables.
> 
> The arm64 tables have misspellings of the same kind ("misprediciton" in
> the ampere tables, "executed.This" in the cortex-a55 tables); the s390
> and riscv tables contain none of the words fixed here.  More remain in the
> tables this series swept and in others -- "conjection" and "banwidth" in
> the Intel uncore tables, "pumpfor" in power8, to name a few -- and those
> are left for follow-up patches.
> 
> Each patch touches description strings only, and each was checked by
> regenerating the tables with
> 
>    jevents.py <arch> all tools/perf/pmu-events/arch out.c out-str.c
> 
> and diffing the result against the one generated from the parent commit:
> every event name and event code is unchanged, and the misspellings are
> gone from the generated string table.  out-str.c shrinks or stays the same
> size, because some corrected descriptions become identical to descriptions
> already stored for other models, and the amd fix swaps a word for another
> of the same length:
> 
>    powerpc  13 files, 55 lines changed   out-str.c -393 bytes
>    intel     5 files,  5 lines changed   out-str.c -477 bytes
>    amd       1 file,   1 line changed    out-str.c size unchanged
> 
> 65 PublicDescription values in power8/other.json end in "42"; the trailing
> "42" is not a misspelling, so it is left alone.  The word "ibufffully"
> in that file is left unchanged as well: the BriefDescription of the same
> event ends with "ibuff", so the boundary is clear, but whether a space or
> a full stop belongs after it is not.
> 
> Written with Hermes Agent, an LLM assistant: it found the words and wrote
> these changelogs and this cover note; the author reviewed every change and
> ran the generator as described above.
> 
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> 
> TAKANO Mitsuhiro (3):
>    perf vendor events powerpc: Fix misspellings in the power tables
>    perf vendor events intel: Fix misspellings in the Intel model tables
>    perf vendor events amd: Fix a misspelling in the amdzen3 table
> 
>   .../arch/powerpc/power10/metrics.json         |  8 ++--
>   .../pmu-events/arch/powerpc/power8/cache.json |  2 +-
>   .../arch/powerpc/power8/memory.json           |  2 +-
>   .../arch/powerpc/power8/metrics.json          |  8 ++--
>   .../pmu-events/arch/powerpc/power8/other.json | 38 +++++++++----------
>   .../arch/powerpc/power8/pipeline.json         |  4 +-
>   .../pmu-events/arch/powerpc/power8/pmc.json   |  4 +-
>   .../pmu-events/arch/powerpc/power9/cache.json |  2 +-
>   .../arch/powerpc/power9/frontend.json         |  2 +-
>   .../arch/powerpc/power9/marked.json           |  4 +-
>   .../arch/powerpc/power9/metrics.json          |  6 +--
>   .../pmu-events/arch/powerpc/power9/other.json | 28 +++++++-------
>   .../arch/powerpc/power9/translation.json      |  2 +-
>   .../pmu-events/arch/x86/amdzen3/branch.json   |  2 +-
>   .../arch/x86/nehalemep/pipeline.json          |  2 +-
>   .../arch/x86/nehalemex/pipeline.json          |  2 +-
>   .../arch/x86/sierraforest/srf-metrics.json    |  2 +-
>   .../arch/x86/westmereep-dp/pipeline.json      |  2 +-
>   .../arch/x86/westmereep-sp/pipeline.json      |  2 +-
>   19 files changed, 61 insertions(+), 61 deletions(-)
> 
> 
> base-commit: 65e4fd942f72a9dba0e4e257290c4fa1aa756854

Reviewed-by: James Clark <james.clark@linaro.org>

