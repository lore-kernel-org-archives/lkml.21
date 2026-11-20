Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795186731;
	b=R9nf+ObwYpFIbt6WdB5H8Ecnk33c60tracyut/+lWN8hk7E3w0ZtO00QXy+tH9xbrqHd
	 SUcy06dDxzUaA3DTyEBTt8x5s1B31go1L33saYwToohjy6xWw9Jcu77BlhqD+iGPv94s9
	 OFdRnurp/B8AA+z97fRrJySzvEkPqbZV+WrRK3g7redw3nkCHQjcUA5YSNvwYjOCrXibQ
	 xIMIPm1Fty0Dmcot/7XJlcx6l6RvxZpBXfvfAEVlWXqlLoVdAtSv+D/ocGSRqz2WV+VzW
	 g9pOtlhxksomxvRD1LjrT6ASPvhk+WawkMncJQC4jdlJ3b5G+Rji83/Ic0VbK4yB+qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795186731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=emRRxOo38GGoG0OqsYCSeZjP1qZaERfoyqyxbY6jVHU=;
	b=u5FfBDwh8RSW1wtgTtVRQkMvvEBT6KP5keNJr2OfUDmUBedEu0u+alrZrXYnoQBI5ucN
	 MsdqpWF37hvtYOLmnj1GzC/82+7XqEGbt3ROiLjZU4JNGKISvVAOnBXTgW/9wvjyLTKsL
	 jRPc3gSBpbY40O1aiqwtk6O1scp20Zrfy8zuDjqdojqdi+hPazTFG8Yps5A5o7tjk0Ur5
	 nJClB9gKphw2C7pu1VSPz07y7IngRPAniLdJIcF+Ro/vYTRP/MeBiXUa7GnMYThaqYEQB
	 uNCMlzS6XCRXnVEmrbK0uEkFT6MQX4g+yhOsljnPg9pktEG/ZHlE4p+dO5duKbYCm4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wVe5RQcL;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3638F60A380F
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3638F60A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wVe5RQcL
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so9772475e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 06:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795186729; x=1795791529; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=emRRxOo38GGoG0OqsYCSeZjP1qZaERfoyqyxbY6jVHU=;
        b=wVe5RQcLmFXzY9rW2IB9oCDZE5MeZRDz3CICNse/KrxYd9jlEfbH2foeoINglAnu1f
         ZqGMJTwZJO7ZCCXQh/DlW4dJYsip0kcCpNE5BtydGs0/jJ17KNxLOgB2IA/kQ9nFN9Zu
         MUgY/JiIssnAi3XYi0LEk0ameOJI84yzv0t8Nr6KwjIpI6TiSRiDoU9Ms0tQK428935d
         e1/AuEtRimD5e9AeM61r/LFRgBp8Eid7EnUzzzKXXDQqU0X4TBQ2o5XIMOrlFGHsOOYY
         +428/eCMDmUqDX1KuLkV58wBhc4V2W6A7mbUNafcyI8A2DQAdl2ch1aDYuP6TaYIJB7h
         9Xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795186729; x=1795791529;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=emRRxOo38GGoG0OqsYCSeZjP1qZaERfoyqyxbY6jVHU=;
        b=rB2QufgNoUUfhLUuZEBQivTv1h5g4bTtTityVhWgTmH7ulu7MyDt0duVzfku6or6S7
         pqVmyi/p/j5ANqTwHrMT+LmhR3kLUJXpKrrQrpU7RBCffSopDCTEAtxi13rSufdSaG0J
         dBUBzcr0jF8Hna4uLvrEY+5EVl1WGNJEjWa7qG4C4nB6IXyXWMH5pY2dXOFtGaR/UYx0
         NfEreodyFo6HatF1uCdDIzfGegw9IHrAGpuZbjMNsJq52PGBOKfoWjIHT4RBprHumL06
         kBLBWHUg8a+JX2PUBJuVhUxmpXgyNUP7L4bE+8f1cKTzQZXC6pqme4vZ94g4K2Izi1lw
         I5cg==
X-Forwarded-Encrypted: i=1; AL+hErFkGaY8n51RN8Jo/nLkSpxsCXYbWU2Z8BhU6gb73VLd0N6sdusV5HQzRiMTSjHD0UXcxf/VPpwOaRw2Luk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9w7eyg75xG7yf4cScd8Q8mOnDDNBby9JzFdWMWpXDi/MLVh/eZ
	lpA6BDWp8jOy+So0KxanPRjMJeczhWNt+EXX1geWLeBmpS2EyS3jzPbXItPiMtzDakw=
X-Gm-Gg: AYBFou1/9Bn57HeMAKND/H9kr2ErlWfObN2dQVl332hDoJE0c+2TK2BBBYyP2c6xI4+
	p1gU4GU1008yumf7Q/l7Vwohs+PiOc17pT1NSZaDsPCM6xkVZXKBBOFP10AT+JEa1RvZ5+oRnbi
	X6JBUXRtM8QDmHQqs+jL87Oxmpql0v17ru3TSflhORC7yzgIFBvXrKFqQ9OwPnmXcqV9cqxBHrM
	N4JGqoZLG1nDyIY+cbExIoWoznIAGjMUL8tGFDfopIvVCEg71cnm9nFSQ88eebhrlE+HiS000rr
	VnypNOxyaqQIaRJMqdn8g01cak+zD1mdUuHGiam9nvMqGIFCTEr5gx0mSuNU+uzvcV7YuWvaEvu
	zIWTvC/0owynZ2xTecwpu7gGdHRPlUkl7ADgoWtqkzIm6SoWHz2Nks/8x24Dr93sC0yhhM168ZI
	ehxLcPSQawJSv0NHwQP1YqvN93SCwdy3nG+ymfBLztbPdcfHiP6E3IMNbeQKD9ecvEjfH9umu44
	s+105a7UlhejFIhROQEODbWKzkbnMbDkBXatvcZbLlEBYO24Q8ZrIYnsLRItkOBdkSbcRlETLhl
	+8lRjeLa4R95nsO8W/ERCp/2s7NFLxBVrg==
X-Received: by 2002:a05:600c:670b:b0:4a6:30c3:1114 with SMTP id 5b1f17b1804b1-4bb88922df3mr71132445e9.12.1795186729437;
        Fri, 20 Nov 2026 06:58:49 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b2c5sm120356755e9.5.2026.11.20.06.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 06:58:48 -0800 (PST)
Message-ID: <9366b008-37e3-483d-b85f-a850bad4253b@linaro.org>
Date: Fri, 20 Nov 2026 14:58:47 +0000
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
Subject: Re: [PATCH v12 2/2] perf jevents: Fail the build on a key the tables
 may not carry
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: Ian Rogers <irogers@google.com>, John Garry <john.garry@linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>, linux-kernel@vger.kernel.org,
 Will Deacon <will@kernel.org>, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@linux.dev>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 linux-perf-users@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>
References: <20261120060931.711483-1-takano32@gmail.com>
 <20261120134252.1036963-1-takano32@gmail.com>
 <20261120134252.1036963-3-takano32@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20261120134252.1036963-3-takano32@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/11/2026 13:42, TAKANO Mitsuhiro wrote:
> jevents.py takes the fields it wants out of each JSON object by name and
> ignores the rest, so a key that is spelled differently is dropped without
> a word and the object is built without whatever that field held.
> 
> Compare the keys of each object with _valid_keys, the keys a table may
> carry, and fail on anything else.  The generator already names the file it
> was reading and the exception names the keys it did not expect, so the
> build stops with a message that says where to look.
> 
> Written with Hermes Agent, an LLM assistant; the author reviewed it and
> ran the generator on every arch directory, with and without a key the
> tables may not carry.
> 
> Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
> ---
>   tools/perf/pmu-events/jevents.py          | 24 +++++++++++
>   tools/perf/tests/shell/jevents_bad_key.sh | 52 +++++++++++++++++++++++
>   2 files changed, 76 insertions(+)
>   create mode 100755 tools/perf/tests/shell/jevents_bad_key.sh
> 
> diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
> index 080e04b51b8c..1baeae76349f 100755
> --- a/tools/perf/pmu-events/jevents.py
> +++ b/tools/perf/pmu-events/jevents.py
> @@ -63,6 +63,27 @@ _json_metric_attributes = [
>   # Attributes that are bools or enum int values, encoded as '0', '1',...
>   _json_enum_attributes = ['aggr_mode', 'deprecated', 'event_grouping', 'perpkg',
>                            'default_show_events']
> +# Keys a table under arch/ may carry.  jevents.py takes the fields it wants by
> +# name and drops the rest without a word, so a key that is spelled differently
> +# is only visible as a field that went missing; a table carrying anything else
> +# is an error.  The list holds the keys jevents.py reads, plus the ones the
> +# tables carry and it does not read: Counter, CountersNumFixed and
> +# CountersNumGeneric (read by nothing) and Experimental (read by metric.py).
> +_valid_keys: Set[str] = {
> +    'AggregationMode', 'AnyThread', 'ArchStdEvent', 'BriefDescription',
> +    'Compat', 'ConfigCode', 'Counter', 'CounterMask',
> +    'CountersNumFixed', 'CountersNumGeneric', 'Data_LA', 'DefaultMetricgroupName',
> +    'DefaultShowEvents', 'Deprecated', 'EdgeDetect', 'EnAllCores',
> +    'EnAllSlices', 'Errata', 'EventCode', 'EventidCode',
> +    'EventName', 'Experimental', 'ExtSel', 'FCMask',
> +    'Filter', 'Invert', 'LegacyCacheCode', 'LegacyConfigCode',
> +    'MetricConstraint', 'MetricExpr', 'MetricGroup', 'MetricgroupNoGroup',
> +    'MetricName', 'MetricThreshold', 'MSRIndex', 'MSRValue',
> +    'NodeType', 'PEBS', 'PerPkg', 'PortMask',
> +    'PublicDescription', 'RdWrMask', 'RetirementLatencyMax', 'RetirementLatencyMean',
> +    'RetirementLatencyMin', 'SampleAfterValue', 'ScaleUnit', 'SliceId',
> +    'ThreadMask', 'UMask', 'Unit',
> +}
>   
>   def file_name_to_table_name(prefix: str, parents: Sequence[str],
>                               dirname: str) -> str:
> @@ -196,6 +217,9 @@ class JsonEvent:
>     def __init__(self, jd: dict):
>       """Constructor passed the dictionary of parsed json values."""
>   
> +    if extra := set(jd) - _valid_keys:
> +      raise ValueError(f'Unknown keys: {sorted(extra)}')
> +
>       def llx(x: int) -> str:
>         """Convert an int to a string similar to a printf modifier of %#llx."""
>         return str(x) if x >= 0 and x < 10 else hex(x)
> diff --git a/tools/perf/tests/shell/jevents_bad_key.sh b/tools/perf/tests/shell/jevents_bad_key.sh
> new file mode 100755
> index 000000000000..6084205b5f4d
> --- /dev/null
> +++ b/tools/perf/tests/shell/jevents_bad_key.sh
> @@ -0,0 +1,52 @@
> +#!/bin/sh
> +# SPDX-License-Identifier: GPL-2.0
> +# Check jevents.py reports unknown keys as errors (no_mlock)
> +#
> +# A key that is spelled differently is dropped without a word, so jevents.py
> +# compares the keys of each object in a table against the keys a table may
> +# carry and fails on anything else.
> +
> +jevents=$(dirname "$0")/../../pmu-events/jevents.py
> +python=${PYTHON:-python3}
> +
> +# An installed perf has the test but not the generator, and a python that is
> +# not there or too old to run it is a skip, not a failure of the check.
> +[ -r "${jevents}" ] || exit 2
> +[ "$("${python}" -c 'import sys; print(sys.version_info >= (3, 9))' 2>/dev/null)" = True ] \
> +  || exit 2
> +
> +tmp=$(mktemp -d) || exit 2
> +trap 'rm -rf "${tmp}"' EXIT HUP INT TERM
> +tables="${tmp}/arch/x86/model"
> +mkdir -p "${tables}" "${tmp}/arch/common"
> +printf '[]\n' > "${tmp}/arch/common/empty.json"
> +printf 'Family-model,Version,Filename,EventType\nGenuineIntel-6-97,v1.0,model,core\n' \
> +  > "${tmp}/arch/x86/mapfile.csv"
> +printf '[{"EventName": "a", "NotAKey": "x"}]\n' > "${tables}/events.json"
> +
> +if "${python}" -B "${jevents}" x86 all "${tmp}/arch" \
> +    "${tmp}/pmu-events.c" "${tmp}/pmu-events-string.c" \
> +    > "${tmp}/out" 2> "${tmp}/err"; then
> +  echo "jevents.py accepted a key it does not read" >&2
> +  exit 1
> +fi
> +
> +# The generator says which file it was reading, and the exception says which
> +# key it did not expect.
> +grep -qF -- "Exception processing" "${tmp}/out" || {
> +  echo "jevents.py failed without naming the file" >&2
> +  cat "${tmp}/out" "${tmp}/err" >&2
> +  exit 1
> +}
> +grep -qF -- "${tables}/events.json" "${tmp}/out" || {
> +  echo "jevents.py failed without naming the path" >&2
> +  cat "${tmp}/out" "${tmp}/err" >&2
> +  exit 1
> +}
> +grep -qF -- "NotAKey" "${tmp}/err" || {
> +  echo "jevents.py failed without naming the key" >&2
> +  cat "${tmp}/out" "${tmp}/err" >&2
> +  exit 1
> +}
> +
> +exit 0

Reviewed-by: James Clark <james.clark@linaro.org>

