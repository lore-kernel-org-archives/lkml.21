Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795647919;
	b=wwI7Mo87boVfFp7+EcaIJnnU7RXmP6fgbr/bcdzj74RyRdixb/cJdN2vtrJo1ZdPnh1l
	 T5DB2mdkES7IjTJoLyNc1lwU+VQwYrrr5VTC9NksIMtAXim5884IFo6Ge8lXk7dQVeJEl
	 MySOtIkg2Xh4wx+ltbkFdXQEwRLXbwSBgHSEoND0l6rHLdviv4ga/SZVgeLURW1QAUdA0
	 5J9SzFgqtooQST1v2sghNARSon0JpsomAuZn9j/FdQW9H21QOAk+OQEUpPJ4tZVEsHDlD
	 LL05POxuk8PkjB0LAulOO2iw0S+P60cDSd4y8sfxvRkXE1qW1kXUpUazxl6IKoOrASA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CUsk4JOA/Gc1KFGSW+8tuCRNrI5ZcDI7rXD/0VX8tFY=;
	b=fEaiW89JCsIpCZYm7qX/XkQPCRlLuEDnLkvYWznB3I2YHjMXhoilrs03mrKk02nQMhL3
	 4w1dni6gVTBEO4YXaFXlGZzIaU1tjk8TCyKE+M5H46ur1DFkQHbtLdlIzg7jk/ZpFzpLR
	 k9+CQ298tlU8b2vJ5Azudx1dgTEfQkEZBzv6B6tJecX3OdnvoK9ICc4ZTiUqX512wv60q
	 QeZOmd+87vqm4DHzHHDhPdQNj02W7pX2x2Wl9dwPd2quAZwz4PQWhnYHzthfJ9G0u2r6C
	 +ENBjaHQGATCFvkBftnG8mt9lnDRGz0poBGbC8q9fPgdMSCEdFyaT60JHcBo9kTGBVQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.oaklandcc.edu;
	spf=pass smtp.mailfrom=student.oaklandcc.edu;
	dkim=pass header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=e7+Vs4DD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFDA6606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFDA6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.oaklandcc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=student.oaklandcc.edu header.i=@student.oaklandcc.edu header.a=rsa-sha256 header.s=google header.b=e7+Vs4DD
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67db35e7953so6564685d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:05:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795647918; cv=none;
        d=google.com; s=arc-20260327;
        b=OY991Q36/Ri6dC83TndhX41Sq3zAz46MdykUvuB8RWsxj6pL6KzaDpNBuYBkG7G8P3
         AXM6vf6slMAQ/45mumABSTixALAychzFTKE/SbYCyQngH0L/Oif++WcN+pB0z35+ukcA
         wgDlKIwN/GAO/OzR+KHPSdru7Evh7mG7OFAHCJS3szHDJtRVA2EN8/RUh8B0DOFG/Hda
         N0XbV2aYDh2bbM1EVJWvtkXc6WrZcAW0f+3f3fkXTvOALpJThP/hNfTtnVka9JEmhSLR
         WBH6Bte+LBlQ938C3eHZ8k5tHU7AyZ+8WhpxSdvd9LELaH3BnJbbyB/KnzZIHv49yvdW
         +6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CUsk4JOA/Gc1KFGSW+8tuCRNrI5ZcDI7rXD/0VX8tFY=;
        fh=k2hECnox4EElBKjO3Q8KC0beJCxBfUAauTcQcG5ZXeY=;
        b=KBk/W9iM6b+Aw6NN9Lfp0wlW95P125NICaMUIEjIJIMbKBicpr3Hb6EnDPKsccuNmU
         jWcQ/ygnvhv492oSu5qzWZxqiVLb84YgZgTGKRASYATO0DX9GNa2zGRjmhJbdebTJzYw
         bXnKpU235graKoIk3m89pFEm5T7lQjwc3ofeAq/G26lTQ8Pl7faRml40xmX0iPg0SNVq
         CD3sFgYtEZfSSvxqZQ1JJLMR1fA4sd1u7gySvxWvlUgt7rfviP50v9imUbUpsiWb2uiG
         xhxPAm91btwDwvQilZzVukzMBsYP5QX0cXr1CG9HZYJVAPJV0RypPCqRxSyIExEIM9I4
         mVrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student.oaklandcc.edu; s=google; t=1795647918; x=1796252718; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUsk4JOA/Gc1KFGSW+8tuCRNrI5ZcDI7rXD/0VX8tFY=;
        b=e7+Vs4DDJo1B2Q1iI2PWxZfCmS6brvA/bVQum+7hECoCGsqT0ia9Ukqc2CLFa/YIbZ
         QjUnxOQCuekDq3cFSgGlcnJIpvXhZ+0QKIM7IEyjvevz99ijO9ZnFkkHKAMjjbE263Qz
         T6c29MLxr9BGfpOwcsiy0YIErsjV5DYSthPz4xWgsHMnRVcr3RCQjCTNxj7RuB3FwLs2
         8impjS9W5pffnie64PXtIMQAmm2N1fiSZ2bnPgsf17iaipVIzK0Gc4Owd4lJ/RSmKnVh
         W5dXGU/DGXBTn0awUjPlDEizQ5PrUKZApRvixQkn9XvCK29jJU0KVg0zbeNNIPleP9+0
         aG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795647918; x=1796252718;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CUsk4JOA/Gc1KFGSW+8tuCRNrI5ZcDI7rXD/0VX8tFY=;
        b=bEueOpaCBinI3F52ipDZqAmKtFwcXQEg24nq2iBNCCjdxKCK77k86X8A0xerNmH1Or
         U0Jlaat8V4L7z9nbRFlzSOfqeorHOJLe+VUQq4FdjMEZj/S5dvlFGz25ldRWBTVVWkEG
         HUl4IMtEE4gR3xbW9cwlJV5gq/0D0XiOm3Ixhn797ox+mxgqMTRkpLW7obauE8DHZyVF
         FDSGxdNDWdQROzlz3TPcEaUEVl94Onz+/LcKvgbkHTHdznps3YgzYQ0nNp2CBWO51YBQ
         CPHqPKmb4c9RG6gcYYckmitsQMXFcR3fadUsxkzITL51ACeO+Mmu8jsZeGm4F3JEiSZo
         JhXg==
X-Forwarded-Encrypted: i=1; AL+hErEvbdhWzyJ6br1WnXsC026cREqeP4+Qb6CDC086ZQ/VR0V5rM8udkfPPRXyjedd9nJ+2gf1BvfQVsDIWFE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Q2CERymoCEkoCnP3dXZcs+4tSQ/PJzeE5MJ/d6C20XtPtkwGQ
	uwyjb7iUQYWXYijrcT+HNCNhpwqo0M0aXrJ4BXuZ54rY6c6ktdRr44Mbv69+9162jEXp94gnGln
	u3OaJGhqCxMGae2pkXboPlxf5ISGYntwKYi9JG3SxYg==
X-Gm-Gg: AZFdTZeLuLlPB2d2OfCaXD6DAndzg0Bnjyffqw4IV98x/nCsWMiMTJcvAxn5K/ozWh3
	N3BrtGlr13nJu++K3nj/okdJsgKf2GEoqv9RZOxHSeiTNZABt0ORRO5XBwPNPG7BpRRJBJlLJU1
	aUEQjP209WLJVCguaVRA5vpvkCv2rMns9/sbjrw0rFvTCLAeQPzjjbAmO5lcxsXZ5cpzlnqO9P1
	xRa5ZvcEhXndsQAkCvgKXdFpwNigYNirKJJ43/iHOOheKrbprrwdeWIGxAWv0Cnmo9RE/b1981m
	gGWq9FukNPtd9AhWp9rtVwotJpXZTpAVAeJt3UEzfUEYScs2ODwQ2qrXahUqLMG8YYsTNCXEk99
	0db70HbIE9MYqI/b/+EvWwsFvPd72s7JKzE5958OP2G94BZq9/Iiz5ORXetqIfbzSASq6Gs97HO
	rdRXGNx6rsPS/jm5RgV31AkhEum3B3WwDtT9qqfyN484aQ+CdQg9ybaQ==
X-Received: by 2002:a05:690e:bc7:b0:67d:bdf4:f432 with SMTP id
 956f58d0204a3-67df42ccf49mr6310765d50.11.1795647917923; Wed, 25 Nov 2026
 15:05:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124-kunit-v2-v2-0-e1adbcad6b48@student.oaklandcc.edu>
 <20261124-kunit-v2-v2-2-e1adbcad6b48@student.oaklandcc.edu> <a8ddf62a-071e-485b-883d-95088ef50ba4@davidgow.net>
In-Reply-To: <a8ddf62a-071e-485b-883d-95088ef50ba4@davidgow.net>
From: "Poulin, Louis" <poulin.louis@student.oaklandcc.edu>
Date: Wed, 25 Nov 2026 18:05:05 -0500
X-Gm-Features: Aa3M54pKK9wFagi79A7F5Aq1lIG5lvOo_v3I9SHXFaydZ24r_eqXrQ36m_To4fc
Message-ID: <CAGQButtBSOMZCeRX1ks=AoO4QEQ-w1LaNX8KUVep0t=raohL9w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] kunit: tool: Fail on out-of-sequence test numbers
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On 25/11/2026 13:22, David Gow wrote:
> Hmm... I distinctly recall there being a reason we didn't fail in this
> case: I think it was due to some tests being triggered early, so having
> two concatenated KTAP outputs in the kernel log at boot. That seems
> fixed, though, so I don't have a fundamental objection to this.

I had an opportunity to do some digging so I did. I do not have a real
boot log holding two outputs; what I have is below.

lore, messages where the error text appears in a log (links at the end):

  [1] 2022-02-11, Ricardo Ribalda: kunit.py run --arch=x86_64 with PCI,
      USB4 and USB4_KUNIT_TEST enabled gives "plenty of" "[ERROR] Test
      property-entry: Expected test number N but found N+1" (numbers as
      he wrote them). He writes that with the previous patch reverted
      "all works fine".
  [2] 2022-11-01, Mauro Chehab: i915 mock selftests loaded twice, the
      dmesg re-assembled by hand (the "TAP version" lines first) so
      that kunit.py parse would read it. It printed "Expected test
      number 2 but found 1", both suites [PASSED], "Ran 36 tests:
      passed: 36, errors: 1".
  [3] 2022-11-07, Daniel Latypov: two plain files standing in for
      module output in debugfs (he could not get module tests to work
      locally), read in one kunit.py parse run with a patch of his:
      both suites [PASSED], "Expected test number 2 but found 1",
      "Ran 2 tests: passed: 2, errors: 1". He writes that the top
      level test counter resets between modules, "iirc".
  [4] 2023-10-04, Michal Wajdeczko: kunit-test.ko, then
      kunit-example-test.ko: "Expected test number 1 but found 7",
      "Ran 12 tests: passed: 6, skipped: 6, errors: 1". His patch
      resets the suite counter right before running tests.
  [5] 2024-05-14, Stephen Boyd: kunit.py run --arch=s390 printed
      "Expected test number 1 but found N" (N = 2..9) before each of
      eight [PASSED] suites; the run ends with "The kernel seems to
      have crashed". His message does not discuss those lines. I have
      not reproduced them.
  [6] 2025-10-23, Sander Vanheule: regmap tests printed "Expected test
      number 7 but found 8" (up to "23 but found 24") on passing
      parameterized cases, in a run with tens of thousands of log
      lines from a dev_warn() his patch added. He proposed
      dev_warn_once() instead and Mark Brown agreed. I do not know
      the cause.

My runs: QEMU x86_64, KUnit built as modules, dmesg saved after
kunit-example-test.ko loaded, parsed with v7.4-rc1 kunit.py without and
with this series. The counter fix is 2e3c94aed51e ("kunit: Reset suite
counter right before running tests"), in v6.7 and v6.6.13.

  v6.5      No top-level plan. Example alone ("ok 1") and after
            kunit-test.ko ("ok 6"): exit 0 with one error ("missing
            subtest result line"); the same with the series.
  v6.6      After kunit-test.ko: "ok 6 example" under "1..1". Exit 0
            with one error ("Expected test number 1 but found 6");
            with the series, exit 1, failed 1, errors 1. Example
            alone ("ok 1"): exit 0, no errors; the same with the
            series.
  v7.4-rc1  "ok 3 example" under "1..3", alone and after
            kunit-test.ko: exit 0, no errors; the same with the
            series.

Two outputs concatenated, built from the saved dmesg (v6.5 with one
"KTAP version 1" line added in front, as in [2]):

  v6.5      Exit 0 with "Expected test number 2 but found 1"; with
            the series, exit 1, failed 1, errors 1.
  v6.6 and  The first output is parsed and the second is not; exit 0,
  v7.4-rc1  the same with the series.

Synthetic: two top-level blocks ("KTAP version 1", "1..1", one suite)
in one file, the second numbered 1, numbered 2, or "not ok". Both
parsers print the first block and exit 0; the second block, including
its "not ok", does not appear in either output.

> That being said, if anyone's using the KUnit KTAP parser for
> non-KUnit-y things which would fall afoul of this, now's the time to
> speak up!

In the tree, kunit_parser is imported by kunit.py, kunit_json.py,
kunit_junit.py and kunit_tool_test.py; I checked with grep and a GitHub
code search of torvalds/linux (its one other hit, in
tools/verification/rvgen, is an unrelated variable name). I have no
information about out-of-tree users.

> For the comments: I think they need to be more specific about what
> we're doing (and targeted at people reading the code, not people
> looking at the changes in the patch).

In the v3 I have prepared (not sent), the comment reads "Mark the test
as failed if it is not correctly numbered." The original comment stays
in test_parse_late_test_plan(), whose input is now "ok 1 test1" before
"1..4" (SUCCESS, errors=1).

> Do you think it'd be sensible to consolidate a few of them into a
> smaller number of more complicated examples. [...] it'd be great to
> have the test inputs in separate files in tools/testing/kunit/
> test_data/ as with most of the other tests.

The seven inline tests are two tests that read
test_data/test_wrong_test_numbers.log and
test_data/test_wrong_suite_numbers.log. The first log has repeated,
skipped and failed results with the wrong number; the second has a
wrongly numbered suite, a wrongly numbered nested case and a wrongly
numbered suite with a skipped case.

> [...] I'm not sure we need to separately verify that this causes a
> specific exit code given we're already testing that it gives tests
> with TestStatus.FAILURE above [...]

The CLI exit-code test is removed.

Louis

[1] https://lore.kernel.org/r/CANiDSCs7M_hSb2njr50_d3z=cx=N9gWHzVe-HkpCV1Au8yVwOw@mail.gmail.com
[2] https://lore.kernel.org/r/20221101134334.59500e01@maurocar-mobl2
[3] https://lore.kernel.org/r/CAGS_qxpZokOs5vEhiiTtD4_c0h79MabGm4dmQ=C%2Bt0qoZEc6iQ@mail.gmail.com
[4] https://lore.kernel.org/r/20231004205700.1511-1-michal.wajdeczko@intel.com
[5] https://lore.kernel.org/r/9be47cd74b62ba8e4a36f3139fc8d275.sboyd@kernel.org
[6] https://lore.kernel.org/r/833a6495c2b16e1da90c19826839191eec21e6f2.camel@svanheule.net
