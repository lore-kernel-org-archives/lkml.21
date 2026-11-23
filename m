Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795459467;
	b=D3bUGLF6fTfMeqMhjvVT0BGPQ9kOhbCesTlRt1uCD4MyiZw1m99/59MQjqhr3ElNwuus
	 WI//ZYrQ+vtN98WavitAG8dJSmAOpQbAjnBSf7aHAPlUsNvFARcPzP7DEdj4k6W3Gvsdd
	 sjVmjro4b1WMUMhqqk4RtnUe6jotu7JG0pnzLEcHdD/AZS5jOCHKcX044ylqq9MPCRBPv
	 IpVZHW0tFfgkqsIFBITFzTGXHFwa2v3D9U8FSnwKyr0KvMHYtXYyDgF5RfXh5+7cy8q44
	 QSOJpEeyFTomKk3ni8ym44IOrOSPxTtp/Hl7fUT0Tn7mETMKv0jHYAINmFNYvXQk2Gg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795459467;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Qpy9q3tA9qQtSLTg1mBMWXjE/nQplNi9tWL6pr4AjbI=;
	b=JYtsGrDISqJ3ZzEn3txxVWtdAEoR19Gl4dt8tv6uYGLGdCM63Mt/g2fkn4ZeJJrA6xZe
	 br7VTTgLsdvJQWk7i5D0CZNOMXj7GRz/JYqA74JaSTM1cZ3p1phxRjmGLzZyrFda19tKq
	 zhZO/N1I4UplEu4VoPooB+3mdbNnBxU94ex4mk+VlrgFF+b72Pn12Qzj+t35AZHDFPGzV
	 BQ0RILtpG9LhHtnSsmnthz/mTI23cbOBQ1e00KwxlAjCbL1fW05GBPKleDq/hd32y1rLi
	 c2GIfsDDkfPnZw6qg5nFbcONCfoPkQRkR7CKySkKEbAi81CM2+Z8UJyAUXSK5Imx23A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="IT5JsX/d";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.169
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CD4606A69A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:44:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6CD4606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IT5JsX/d
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-55be673e029so501611cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:44:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795459466; cv=none;
        d=google.com; s=arc-20260327;
        b=VwF2w49n0zoKuka18lZhE9Iz+zQ81eRcbqPrsDW5ZX7WNXBg9ZqstmcQp0c98pDj9w
         4hinQbkoh+9sMBd2NgQiJ39HRO/E1ZsKNTkMkwz0X7DPnQdwnmA8HRF5liW0HNJuVmaA
         3tDGEZLjiCBT/mO6odRdypU1VlpLiiOOMkVPXYYapXnMMU1EPkQ8cd07quGM3AZmsVT6
         2w2N7t0q+8x7heMrfm5/hFdCY9hQpIyHx1Rm08RYH+LJPeydkh8emfViISIl6mWhGE4A
         DBPXPfbFRHXeNMLTZh1k9eZz/Unqu5aeMeZUlpJUt6lytBA7mp/8LvbixzfVFXwEWBnH
         wN0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qpy9q3tA9qQtSLTg1mBMWXjE/nQplNi9tWL6pr4AjbI=;
        fh=rAtHp51y+4YSYrjFT0JIDmp14eyRo2KlW/wiZYn9Xu0=;
        b=Iwj4GUYorU8hTfagsShRZI6aKl21NOvLf9Cj50lN2oYkzFaso8fflkfvyAVukfy7Wl
         W3T8Z55atjnXUuXFBiaIknrqmWlwkfFHDV4ZQ1kllqXmSr6KMYya8kAI2R0XfriULHTc
         VT6FoIVaDv8IwN/7EazcybOPF5OaWEC52AN2G7vyIjeov4MG/l6OWqPxuXqscVGJjT8i
         GBL6y3/JlJ2yzINUHCilMjlFxfuV+cwipHel4n7TOYauYizCxz+yR2GJl6qtU8Rxzwho
         eCXsvTo/1DHHBGZawOodcW+HhLKbprOvXbxNKSzw/+mKDnNb4aTno1tnSKSKw2XcNUsw
         8TcA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795459466; x=1796064266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qpy9q3tA9qQtSLTg1mBMWXjE/nQplNi9tWL6pr4AjbI=;
        b=IT5JsX/dtjOhmY9E/JG/x89RsilUFdKcK1wywxQLw0TFNzHPUuuGDilgqzyY6G/RJj
         tWXE/l/tpsOcHGScQSh3t34esQf5ZhMHQ3DRaox9hGo+os1FwebSyw+6zXg55Q6q32X9
         XyupyygjD6ha8TYu3qioTgsLYrcYLTmIDoF621+7FzTOX6WFcW9WDj9bETKNfEo895Hi
         FdJPOIOKyYLHui61RW+dglVJX+1Kxm6u2Ck3DHOdhHrtOAdZoNabB/p4k7mNObJH3hz7
         4yvmlu4UX8vVnQNzzOFkScUhdO9yv+E3fBhcqAX1Yf5uacAHMmAytP/houVeVqchPuvj
         ceXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795459466; x=1796064266;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qpy9q3tA9qQtSLTg1mBMWXjE/nQplNi9tWL6pr4AjbI=;
        b=s83vW9NBesr1ousQKtvMYdkczSHpwpEXwA3f+Jmf9XcFvybKV0AAVwWdKy1vacSVub
         48EAGcQhSCmVqb/GN0CGhNq7AVHSSfbH29YKLpAxxFhT6s+aKCdVIegEEQO8HUo2PZp7
         XDS/iXUDNPwoLCuZ4r3mMloGuNRCOd/UxFCaFgyNFLcUJtqCkPRSJXEyH4D9GtwQR7Tb
         Lebt6XftKwo39A/oqI1cY/BXVvIG6uR/Atvco5VAscQfLEqz0bjp07MV5/OE6AknJeFa
         zO7Cnei2S/xH66x2jWse7RlVW4lGaEXHfA1Xq/yRndDnG8FxK6hmYWeHvX1FIFnrEGdQ
         HTaA==
X-Forwarded-Encrypted: i=1; AL+hErFvJVHwbnbb/IAH5eXRUl++O2i9GS/3wWH8su0kJKGL79/zjsl67VDeTGYjhRR0mG5p4c7hR0iUmy2LVao=@vger.kernel.org
X-Gm-Message-State: APuU4Z8PVU508c93/Y+tKil7K2VSYhZdxqlprn95d3uYlFTVSNtUjO0M
	VpWDUaC4PrYvUjEZPJ9EV3iAVPW1N1H92+RH4juXgpT4h93xFEhLxJSb7J5WqfL7Zob7FZOyA/e
	OOAvzbKuh4+XpiM31b/eInKxFKbtDnIqv31gg0yYc49TnTmQNVgCouptc
X-Gm-Gg: AZFdTZfg4r1ge/qL5YqWc6gpSveyhG1cHrNxtHpSH3+ocCsbKrKivmiF+frxeUKvLc3
	xSq6WuLFvK2O7kAlnCpNEjLz9zOM8P705iDcMHRo6csqznwT31WUdLlHZCp+PvbKKvGTyfHEMHA
	4UQp6yHVKN7T+54oGrqW3Q+gq0HBV1Vf8Eq2ySihLzq+sDDKMChDXsPxBMtC2m28rMPfYHWM3pu
	ToANZNcYixiLrUQvP2J03TQRO/Oj4mp1T4jdPsbfKex70CtXGdhcln5mZp5/WnWa8yiI1BgysFn
	EaH3PH1W3oq7Ry/AHOreNwo3viuoAbycldAYJ42Zyz8bAN+zxpuPgT4ZCc/4YOEV2PSZ4SJFWLh
	jX3GGbX/T255DCwCEI1bAjXppeBogFOrcnaHi
X-Received: by 2002:a05:622a:2598:b0:533:9731:f0f1 with SMTP id
 d75a77b69052e-55d890363c8mr39729921cf.10.1795459464949; Mon, 23 Nov 2026
 10:44:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-james-perf-late-parse-attr-v1-1-cfebcd81a962@linaro.org>
In-Reply-To: <20261123-james-perf-late-parse-attr-v1-1-cfebcd81a962@linaro.org>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Nov 2026 10:44:12 -0800
X-Gm-Features: Aa3M54p16W7pU3nt1aynmNQ3smtylrp8OV-U9T0DYy6BSjG3aVS2eWBmNAGg92s
Message-ID: <CAP-5=fXuQWTt1F6BvKSXqgSkEtBQPKvKg6gmAe-ngyr4VGyGig@mail.gmail.com>
Subject: Re: [PATCH] perf build: Only enable context analysis with Clang 23 or later
To: James Clark <james.clark@linaro.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 8:46=E2=80=AFAM James Clark <james.clark@linaro.org=
> wrote:
>
> Context analysis requires Clang 23 or later (see
> Documentation/dev-tools/context-analysis.rst), otherwise the build fails
> on older versions, e.g. Clang 18:
>
>   util/env.h:142:39: error: use of undeclared identifier 'lock'
>     142 |    struct rb_root          infos __guarded_by(&lock);
>
> Only enable it when the Clang version is supported. Leave the other
> thread safety options enabled if they exist because they don't cause
> build failures at the moment, and might provide benefits even without
> -DWARN_CONTEXT_ANALYSIS.

So we've had -Wthread-safety for a long time in the perf tree, I'm
guessing __guarded_by is missing on older clang versions. Can we just
stub out the __guarded_by for these old clang versions and keep the
lock checking?

Thanks,
Ian

> Fixes: 321967859933 ("perf build: Enable context analysis and Clang threa=
d-safety flags")
> Signed-off-by: James Clark <james.clark@linaro.org>
> ---
> Assisted by Claude Opus 5.5
> ---
>  tools/perf/Makefile.config | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> index aed2e952c8f3..f5adceee5589 100644
> --- a/tools/perf/Makefile.config
> +++ b/tools/perf/Makefile.config
> @@ -65,11 +65,15 @@ ifeq ($(CC_NO_CLANG), 0)
>      CXX :=3D $(CXX) $(CLANG_FLAGS) -fintegrated-as
>    endif
>
> -  # Enable context analysis (linux/compiler-context-analysis.h gates its=
 Clang
> -  # attributes behind WARN_CONTEXT_ANALYSIS) and Clang thread-safety che=
cks.
> -  CFLAGS +=3D -DWARN_CONTEXT_ANALYSIS -Wthread-safety
> +  CFLAGS +=3D -Wthread-safety
>    CFLAGS +=3D $(call cc-option,-Wthread-safety-pointer -Wthread-safety-b=
eta)
> -  CFLAGS +=3D $(call cc-option,-fexperimental-late-parse-attributes)
> +
> +  # Enable context analysis (linux/compiler-context-analysis.h gates its=
 Clang
> +  # attributes behind WARN_CONTEXT_ANALYSIS). Requires Clang 23 or later=
.
> +  CLANG_MAJOR :=3D $(shell echo __clang_major__ | $(CC) -E -P -x c - 2>/=
dev/null)
> +  ifeq ($(shell test "$(CLANG_MAJOR)" -ge 23 2>/dev/null && echo y),y)
> +    CFLAGS +=3D -DWARN_CONTEXT_ANALYSIS -fexperimental-late-parse-attrib=
utes
> +  endif
>  endif
>
>  include $(srctree)/tools/scripts/Makefile.arch
>
> ---
> base-commit: eb79d2fbc230d41b009e49f20671303c6efbd946
> change-id: 20261123-james-perf-late-parse-attr-4e996381859f
>
> Best regards,
> --
> James Clark <james.clark@linaro.org>
>
