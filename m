Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795188173;
	b=MORMqd6/qb+LSTDnsGBjpuPKTA8zNZ2KbZCLUuvKN4/KiFvKUs3npDLb9XUgNpqXOgv7
	 v52O4Dez3DkOXgVwcJFgeTOUYDdlPMbPa3ByMh/SqAB64bOJqm+JKE/jUncaGFkeOxcI5
	 7LVZQ7we8tTi7KPtSYyLpC9tEg1Y+SltAfTh7jk/FoLXX7+AqrTIikpixSdsSxxJXVXOc
	 gAV0Bm8EIzZ4QZbr5DUk69XsL2PdIV+CxwY5WsJbHw5of6jhXmP0kaVMxjbxgNOa98mSe
	 vEEH5Ri8wR1VCYhydZfacLB4O5DagjYaJQcYCLuF3/t1pjOQKmgZPhLuPQlDAu42EcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
	b=1T63WMBxZd2LHqDVR2Fubc4S7xaHa7al1YiA+XUXkcFOnSumoz/TEM9iWns/BOHM7ajP
	 w2jCLgwPDS2m11DBZEYCJBYscxNBuZjOVWemG1urztXo5EejEjuThUzFgPVTnd5gHA5IF
	 L+nGLkhyKwz8UKIwXWufa83Sg1rGi4/rTxgH804Ybfc2Db1eauFwb44Wa6eucyoO/Uk9R
	 dSJ3FeTKo9r5Igme71Nd4eIomy8Y+wb2tQjMKDuwIREfxVqcONXvzhF/uXc/GpoSrLrbe
	 LG6BuIzBAu8gcYHV73ewXDDUNHNqFS2eQhx4C1s4ws2oE/wFJfFmOMbYdST5YJpe+Ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lNo+4Pcf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6338C606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6338C606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lNo+4Pcf
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdab938dc83so475658a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795188173; cv=none;
        d=google.com; s=arc-20260327;
        b=OMjlgS3s6/eUn9CbDObfZYmjUaZTTlHPTdeWrYXct6LudilRD5Ja5CCku5hFHzCO+n
         kYYkE2As3r8f77eY9PITnao3aMGUAKyXjBEllmZoeuV1wngQCOAauULz0L0EKbygxT+d
         tf1M9n/7Go4vG/gdX1jJrBuyOklKUL5UJEYbjqD2ZXG7DxLVZmRDD9MSCxU7/9ICPRPd
         aoK95JDFsfqUtRX8McHWxHMxavu6lRzgmFs/8yRmYuXb/+svWBgWa1CqkwFR+9xDd8Qe
         ssXTIx5jsjoqZsaR0RDOPl4WBhKyZ2or410p2a0+W4zix/pbskQbL7DOdCEEkCxK6dxx
         WYag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
        fh=w1i5BOSshQ8nbwuS7oB896yoZ2zgIKM5impe6JrxaMA=;
        b=jafxrH/xRdErZDRJr0LEssnBLswLKXFC9GD59rERiClH5cRR3kGSETyUNTckuVcP/m
         Kvk6ds31JJS65wYk5Q6VaQI5kFVGj9oPz04YEeNz/P402G5nAduef8EHq9f0L2T+yiFH
         BzEyf1/xvpeLtDQhXh8SO8UHzow5bvjtJ9h/9j1cGi65X2sEWwwFH0IQLK6PEplT+nBT
         PBxNQrIjQ/fdME/TeYWH3wLU4v/bERjMJlQaOLAMIsrijAaPnAct3I2uGqk0o1PG+7WL
         4A0raNRb9i2HkjDUtupPW7fBWK7c0vZDdfWTLH+XocaPWUX0PNQcvAhJ1TU42MPUvfLM
         np3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795188173; x=1795792973; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
        b=lNo+4Pcf4UnV19UT58axrldYv7dhQBVZ3fequvH7Acwo9EtIsYnPqL09oXGkoyspql
         H7j62Fw4IT6uxOfSxpIsZECkoYj7VnFVnINCDXqv02qKW6gQHJCc5i1khm00LwnWvKSd
         QWMMyGCsu+ClVjZsmJ+OuYrToza0terwS/aio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188173; x=1795792973;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yLH5VmnXQCypmMYtDPpOLMEB0hSwbpVq9ORFIbZcbww=;
        b=ecJFcA067Jxr5ydh2ylePw+X0do+cq9OX+ZmMnFkPoc0yfs0+7H335auGEOwurHuQv
         81MDDn8AtJTjWCCftbVZvXgqD5soLxVCi0JC1Bx82e11eebVRKtIwPYZ3B3wJXovFxJK
         OLIfAGIlMd3GRvYgzEfwCNAGdSInY9GQ6iSSlqXTMZs/MtS+dieOBSKvIipyr2UohISk
         n6yb2YH4v9kUmJhk+viC51xAN9G+308ajVDq88xP5xwhzRAvV5Up2rvqKII9WOqodZ5j
         i6wjUqhIYTDWy/eZnw4B6Cu5UjNd8EKjSrMki3KGHX8pihxAG8pG0sKcIEGoub5Ssejz
         doGA==
X-Forwarded-Encrypted: i=1; AL+hErEx2ZM7qO/tjoZrvnlhCExYdtdDqXkfS/tnzfrzQhtzhpAwU7tVn8+E0P2bEBDeiQ70+rJI4sJeouB4iMs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lzo/9PN8cCPeZzPdGBjwdFuDEtJzT6nn0fGAg/SL1LRXgQwYb
	cOhPqOC/SDY4JicaabcbtUFAs2EAc7j6X2SrXp+XIH82LLHmBoOkinb2dXM5teu8WaVnnTFZPbs
	o08Ss3ngliWw1hBrzjrtyAD0nKPDtz7qtoP0Dt5lJ
X-Gm-Gg: AZFdTZd0CN9qHiyEKS4v8NVY2tVHqZDlHU3QetjYaOA3fs72mLXkO+ox/TpMVJjF4da
	CYkE1GJSWuj+ZODApnrFX1ayfwd3FeV75hDFtGl7Om9gP2dWmNtRZjH+706OAZ9Zrjqc0zqydQe
	WkRJ4+d3D5+4JMcdPmDo8k/dJ3KUicnS3Vn2YqaH7s6Zy04W547uPWw9EcMDA3DnFBoMccg7EGc
	DEz1GTScFgP4D90PloMvC5DMUdAKielJdUiEqvynLMq/itw+qbj/grBNpk8otLWLzf0NKPScwqV
	DZazewTNjgT03hamqWjgUWjTaQHFTxjH2yUwNnWApBNg4VhD8inEImf2c7hDQNw95AZtanYGMOE
	Ims3AclSKSEIZiSD+P6iZIy6QFSrdtvu2p1eJYhS5/l42H3hRfbRSUypF6Oe1a/gOye4cklPEHl
	cOjzVJql3xcH6bIKAH
X-Received: by 2002:a17:90b:4ec5:b0:3ac:b2e6:3181 with SMTP id
 98e67ed59e1d1-3b41c9476d3mr3456886a91.37.1795188172371; Fri, 20 Nov 2026
 07:22:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116205320.1621386-1-dianders@chromium.org> <20261116205320.1621386-7-dianders@chromium.org>
In-Reply-To: <20261116205320.1621386-7-dianders@chromium.org>
From: Simon Glass <sjg@chromium.org>
Date: Fri, 20 Nov 2026 08:22:32 -0700
X-Gm-Features: AclHuK8mmsjs7pN6k3bzNXtd8WoPzoco1JjhltxmsQvDAjAEl007qn__5cOalqU
Message-ID: <CAFLszTjhY-mS0yaUtV4ae4m_zTTBA5rDH4NtoU2MbEQm6WunYA@mail.gmail.com>
Subject: Re: [PATCH v4 06/14] pylibfdt: Speed up FdtRo.properties() with a C helper
To: dianders@chromium.org
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Devicetree@vger.kernel.org, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Saravana Kannan <saravanak@kernel.org>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Simon Glass <sjg@chromium.org>, linux-kernel@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Julius Werner <jwerner@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Hi Douglas,

On 2026-11-16T20:52:57, Douglas Anderson <dianders@chromium.org> wrote:
> pylibfdt: Speed up FdtRo.properties() with a C helper
>
> Iterating over a node's properties via `FdtRo.properties()` currently
> crosses the Python/SWIG boundary `1 + 2 * num_props` times per node
> (`first_property_offset()`, `get_property_by_offset()`, and
> `next_property_offset()`, along with their Python `check_err()` and
> `check_err_null()` wrappers). When walking every property across large
> device trees from Python, those per-property SWIG round-trips dominate
> runtime.
>
> Add a C helper `fdt_node_properties_stub()` in `pylibfdt/libfdt.i`
> backing `FdtRo.properties()` so all `Property` objects for a node are
> collected in a single C call per node, interning property name strings
> via `PyUnicode_InternFromString()`. Also add an invalid-offset exception
> check to `testPropertiesIterator` in `tests/pylibfdt_tests.py`.
>
> On one stress test (walking all ~573k nodes and ~2.06M properties across
> 438 arm64 Qualcomm DTBs) this reduced `FdtRo.properties()` time by
> ~1.8x.
>
> [...]
>
>  pylibfdt/libfdt.i       | 64 +++++++++++++++++++++++++++++++++++++++++++++----
>  tests/pylibfdt_tests.py |  3 +++
>  2 files changed, 63 insertions(+), 4 deletions(-)

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -24,6 +24,61 @@ static int fdt_property_stub(void *fdt, const char *name, const void *val,
> +        name_obj = PyUnicode_InternFromString(pname);
> +        if (!name_obj) {
> +            Py_DECREF(list);
> +            return NULL;
> +        }

Just to check, how much of the 1.8x comes from interning? My
understanding is that interned strings are immortal in Python 3.12 (I
am not sure about later versions), so every distinct property name
seen in any blob stays allocated for the life of the process. If the
gain is small, PyUnicode_FromString() would be safer.

> diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> @@ -477,10 +532,9 @@ class FdtRo(object):
> -        poff = self.first_property_offset(nodeoffset, quiet=QUIET_NOTFOUND)
> -        while poff >= 0:
> -            yield self.get_property_by_offset(poff)
> -            poff = self.next_property_offset(poff, quiet=QUIET_NOTFOUND)
> +        return iter(check_err(
> +            fdt_node_properties_stub(self._fdt, nodeoffset, Property)
> +        ))

This changes the behaviour a little, since properties() is no longer a
generator. The FdtException is now raised by the call itself rather
than on the first next(), and an error part-way through a node (e.g. a
truncated blob) now produces no properties at all, where before the
caller saw the earlier ones first.

I think that is OK, but please can you mention it in the commit
message and update the docstring, which still says 'Yields'.

> diff --git a/tests/pylibfdt_tests.py b/tests/pylibfdt_tests.py
> @@ -270,6 +270,9 @@ class PyLibfdtBasicTests(unittest.TestCase):
> +        with self.assertRaises(FdtException) as e:
> +            list(self.fdt.properties(-1))
> +        self.assertEqual(e.exception.err, -libfdt.BADOFFSET)

There is already an identical check a little further up in this file
(just before testGetName()) and, since it wraps the call in list(), it
passes with both the old and new code.

It would be worth replacing it with a test for the new error path,
i.e. a failure after the first property, such as a blob truncated in
the middle of a node's properties.

Regards,
Simon
