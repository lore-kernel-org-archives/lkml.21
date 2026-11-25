Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612350;
	b=oFd5s42hxcniS2rkOj47xEibJlzjCdqw2RMtkPd+/zMPYQwZQp6KyoQCpD8fWPIiNttu
	 +ZbQrKDkFydltLRQftjWbddXmey0IMfTJ6xNeM8lHJa+Hx8oBla3+YwCOm3ulbrU7WSh2
	 sxZ/rHUVYPI4ZES05rp67u98qyERE0IGKEhg/nj1DFY6QqctJ6dAtWwReQpmCDkqiFRMu
	 C8RD4NQQTUO5PLP0+sXILYH44riLBrKCK+NUeVDOFFMV+Xo3oYvIBirbQAAvmi/2fYwF4
	 DVGUx9ktrWSkqG/h/IV5YRVo5oCiS/2PAqfJF92/rtvsXRVOs2TfSBrQyXWi8vncSzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612350;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:In-Reply-To:References:To:Cc:Message-ID:
	 Content-Type:Content-Transfer-Encoding;
	bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
	b=u3L1JTQIVmCWri5G3+hIMPOOnj10H4y1ap8ikkJve6WDU9xQqxkZ4qPEeu4+/1B0xJBT
	 FkccHMOxeD4DQeBkLQv/N58KDzk4A9x55Umr++d232TqQV7UENnUotf6iO/Tr7ExAqhuU
	 OmCNBoLeRHsu5pO8Cxg2KmWfE6vSnRdw5AnKDanlyEeGW6raqkc1J9C1TISS8kVBXfEA+
	 IshW2NSxMUXa6xr5mqybui0V+vPBhYzZW0baHAfcIUvcBZOCQwny7kOE9RKUD9M4GuR9J
	 AG/z5O4NRFZZyGaKu66L7Ht7CvseCFbaB4s+z69Geto064XTHhiBGV6U/zJ3FhTwtzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNbG6lhM;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C453D606A334
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 13:12:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C453D606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nNbG6lhM
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5364d86f7f0so60501441cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 05:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795612349; x=1796217149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:message-id:cc:to:references
         :in-reply-to:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
        b=nNbG6lhMNlg9s3RxRiJNbZFCcJfSZu9DNa7mYpBntzBscZz1jH+GJVdRxODmIBn/XH
         9T3QeSZ0dBdrShV+5UTQlvRJDGWmaSFgwPG8xaK78m9+1IsZbQZh8uwdbPQRLpLbeQ4O
         xVf9SGqpPHCiDraZ/vP2iJjFbnzcI39gmq/x2WCzCnLx8mO2lMKqvHamXx7lbVYnXZLk
         hcuvxmVxfNp9NbLMuVJ3iDg3B8wRXBSTMgQwkQF6CqLuXOfDj+xbdovSj5yUEFllih75
         XhL6PeZGqPIxDJiSVo3a5v8EE/vrplOfFcWFgb30mkGU9pUBVGKlZqSfFrPBsPBaAqh7
         Z59g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795612349; x=1796217149;
        h=content-transfer-encoding:content-type:message-id:cc:to:references
         :in-reply-to:subject:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UvrRlNwsml3xyPKp+kC1AP2uPPMG8CifNGrPGhS5eEI=;
        b=CDOYRxgJ+NVC5KbfPRFh1O9GAE/Hq+Nj7sMvRwBrpt0dNLSdB6wXAOi5AIGocF2Zz8
         skEheA1rEaqrYxuuU0X08cWGIcVqYpwQ4DdKMaROGHoje+z2T39YkgyoHxaxYbiF82AF
         mRoDRn9sNiH917Sf1bpeBwRefyU7FO+KSpBFNKcP9DA/X+U54949NNY+k4U9gReQTInS
         HS3Qjfh1Q1Hv0aaVy93j1t0ruCuK+wZ3Zlsp4d+/yiAYHnh2cPJZ9wkhWeQRa1jDmPRq
         iHbfE6PL+oylgczBrXFkYn/9lUz4ehUoAsk9fZnF2Ps5Jv9gU9kelOf95gIocXRvjQT6
         cmlw==
X-Forwarded-Encrypted: i=1; AL+hErH777K0J1/EvxSP/jV4BDr9WTOZAdd/yJJLy0+QsTvYzkcCbESPFRF6JDws/BuHGHVBUWjO/6aMHI7iJno=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EMC0SstGSapDJJeKX5i+KMhPi50upb8zLgQ/6W77IyIsiyUad
	sSVt+H5+wuUEvIHtKk3KHKgU83b0B9t2DS1Iw0JT32m34Ka+QZ6YG3A=
X-Gm-Gg: AZFdTZfUymddAAlUCERJIA3g+KNp64jl71JX+FPMZ1/IcxOjtR8i+z9I+xmhNGZa8AQ
	Jt6WDo3wOl6otKYh7GG7Vq0cE1Cubl7XqZ2aYkZVCSeeC/9Hz3Xmc416YgkBqn2SGPwffBedP6X
	i9XyE9ZJYERV4rkBRV0bLA6MyYQTJre4VYf+9eZGB3A/S9YeMc4+rHGeo8qqWeg6ervzdIJzj9/
	PzSAGvlLASUxtziU3MQUyXMg7f21MK120bWcYNZgHS1/LTlwfUUB3AWQWcwSb6Bpsps9b2xxOy0
	kaw4ApmdTjokehVwPkk07Psdhv4G7m5nYzFaRi2FQl7ImtcOZKHX1JxvEKIvvDeu7umGYSpPulb
	OS+zWawp6Z3sEJxVyrj/RmQthDCcfbJ/19HGK+Yr5cHfYOXWQETbMjiSQakNYIIwdOMb3KHUpSa
	lIG/ulGkPIUQiDdFWSEkeKgG0wdebPo5T6iTuOvcQmf0XNuZCE/Dnzz0b5fHa99BCISnWPIvKJw
	n/xTRv55GQxQafVtC1sgbxI+h7ES4cpFuqEkcYnebNCl+5kh5EyyjiPVwRelljuRc1u/HoI9ugn
	hlP/9cqRykRLPuFDxEiWREvjuslx9ftS2fII4PxVLi8q9gGhnbDFEC3AF3vYjY9VihTL9hcPbj2
	U6DWAmAJhcwo66DSNkSYUUNlZ6u3wGH+CLQ65NZlDbULghr3wvJuQVLuUIO2HRhAce4DZJFc=
X-Received: by 2002:a05:622a:34f:b0:55d:3695:c1b8 with SMTP id d75a77b69052e-55d768a24f3mr359297361cf.11.1795612348580;
        Wed, 25 Nov 2026 05:12:28 -0800 (PST)
Received: from [127.0.1.1] (207-237-119-98.s2383.c3-0.nyr-cbr1.nyr.ny.cable.rcncustomer.com. [207.237.119.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7889f8b6sm155981971cf.28.2026.11.25.05.12.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:12:27 -0800 (PST)
From: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
Date: Wed, 25 Nov 2026 13:12:21 -0000
Subject: [PATCH v3] Documentation: kunit: document --summary and --failed
 options
In-Reply-To: <179561234149.225312.4673144866194884043@gmail.com>
References: <179558107134.36587.13120861622026385297@gmail.com>
 <179561234149.225312.4673144866194884043@gmail.com>
To: david@davidgow.net, brendan.higgins@linux.dev, corbet@lwn.net
Cc: danielmaraboo@gmail.com, raemoar63@gmail.com, skhan@linuxfoundation.org,
 rdunlap@infradead.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <179561234149.225312.11200387441465771003@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

Commit 062a9dd9bad7 ("kunit: tool: Only print the summary") and commit
3c67a2c09b3c ("kunit: tool: print failed tests only") added the --summary
and --failed options to kunit.py, but the matching entries in the
run_wrapper documentation were never added.

Add descriptions for both options next to the other output options, so
the documentation lists the arguments the tool actually accepts.

An LLM-based coding assistant helped draft these entries; I checked them
against kunit.py and kunit_parser.py.

Reviewed-by: Daniel Pereira <danielmaraboo@gmail.com>
Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Eugenio Zuccarelli <eugenio.zuccarelli@gmail.com>
---
Changes in v3:
- Reworded both entries per David's suggestions: say what the summary
  contains, and that --failed hides passed and skipped tests.

Changes in v2:
- Moved the tool disclosure into the changelog text; the Assisted-by
  trailer is no longer described in Documentation/process.

 Documentation/dev-tools/kunit/run_wrapper.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/dev-tools/kunit/run_wrapper.rst b/Documentation/dev-tools/kunit/run_wrapper.rst
index cecc110..9e0d83d 100644
--- a/Documentation/dev-tools/kunit/run_wrapper.rst
+++ b/Documentation/dev-tools/kunit/run_wrapper.rst
@@ -327,6 +327,15 @@ command line arguments:
 - ``--junit``: If set, stores the test results in JUnit XML format and prints to `stdout` or
   saves to a file if a filename is specified.
 
+- ``--summary``: If set, prints only the summary of the test results,
+  including the number of tests run and how many failed, rather than the
+  result of every individual test. Does nothing if ``--raw_output`` is set.
+
+- ``--failed``: If set, prints only the tests that failed or crashed,
+  along with the summary line, once all tests have run. Passed and skipped
+  tests are not printed, which makes failures easier to spot in a large
+  run. Does nothing if ``--raw_output`` is set.
+
 - ``--filter``: Specifies filters on test attributes, for example, ``speed!=slow``.
   Multiple filters can be used by wrapping input in quotes and separating filters
   by commas. Example: ``--filter "speed>slow, module=example"``.

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.34.1


