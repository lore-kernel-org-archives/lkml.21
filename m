Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795722103;
	b=sh3GeH1wz5zDsk8YH1E0PQJ0fYTWm/YYOQuJ7/dtV+0gm5yfEnjnzM5mgMiR3ERfpq1Q
	 8koekX3pujLXP/fFSysShZ8mqv+HNhFfNEteLYtzorParBquFYnp62IuaK0OIVeRxcbnM
	 v0wBtKmSvGkGGbc3DQvStJo5bQfYcjy4rMiSWfjuCFd7rNSVAqVwZhdTLjKODBAFQ7lEY
	 RFxn5fazM88q+hLlC66fym75I/J8+S3HJT50WKyCXakEh9D1co0M5NFv+WO9Pi04U7zLm
	 /OX+u/CyJUCl9WLzvQLrDjkgXMyDSCMCHRfnHgfx7fGMijZkiDCdab3EsTxyhgQZp5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=KY418BqW1FceT2VyhopgVkuzgNfxXGz8W25XX/X3PFg=;
	b=AK8Ruedxj6tRvJTT5XLX7+6WKrzyiu8OUkWM3cHtKxA5Vv5CDAm+RuTA7b/v1DQwit5o
	 Sbv1dMdJxuxaDo/jctFkblGxDCvthRdUyhI6L/PAlgbakNuiB2toln6zujvcRYJaaRkFZ
	 EONd2BO8O+vV/iHFvdfhzj314ftmxwWLUa5wXTCEe3IP47pED5KrpnHI4kE5+TZL7TUul
	 YpFZjqAsKGQLCp9RXxbxD7y6dUWxK3T8hbIis2B5AznkEGnUZe1y1dI1m+tXP1+zvWctp
	 05OtO2m2CWUKvLc2AeJMbJG4Cov6h/gqFvtHJvY4Ftxza3MPkkwF2kPWmseU8MR9ckA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWrr7VYY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693D7606A327
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693D7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EWrr7VYY
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b5786e099cso6053326c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:41:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795722102; cv=none;
        d=google.com; s=arc-20260327;
        b=W9xqTRTBTiKoBgnIkfKLs38KnGugUqYrndd1HPic7AJfYAbApf8mEz+At2JkqaBEi9
         9ILSzOStpkd+tHlly1imthLTY5h+xvB3o427p+XW8gLgdZE22nsuI2kbSJG3zsqbbRB9
         bAvs7QAS8H2bicS1OUPjOOqezWP+6QvdcTnj0wzemqseaH6JrDB6LwqfFidjl3ZWbkD7
         3pZEeyF6yOx2qtpM9pCdlGXEuA1SRUB34g/du8zdJQppl2db+ovJafdYSGb2S6DhuD1w
         pQkvGmWRQc7kRMTCj7gR+0ZCbjcg6wPITEHrpiew0+ylu9fX2VbebH2Al4C9xGRNjU0g
         R6Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KY418BqW1FceT2VyhopgVkuzgNfxXGz8W25XX/X3PFg=;
        fh=eT5q5AhROwwTfmNZ7pmuChPa+iNsV+NF2mIKD360CAw=;
        b=XactGn45NxYRuOAIkLXbAHV6e3U2wW7sZo4FAuCZZJSC9dUKHxnNgW4rXghFAXjUIu
         ie5vge0P4v4dD4BQICOKpWRuLGC+RnXt3xc+S9VCRTCZpWbK8KL6aDflpPhfPrp/oVdt
         LkcQ4JJf7SaJRppNCGYx481EtMYquNq7Egfzf8NaN0i2ytd1xeFlI4jEQDlLbLQnUBiP
         DnXoebkA1MjYbCj+sQBjbjcsjWwl0VuRvx9Lwh/oXKqDalJiifSjp7pQxdj46+iDgY+o
         avvZDzEJ3TI58zBP9j2n6QFZXZXWoQPRrWBORDmIzScxm8YS5QxSYbtM4yAlTsptbyUQ
         ZWTw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722102; x=1796326902; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KY418BqW1FceT2VyhopgVkuzgNfxXGz8W25XX/X3PFg=;
        b=EWrr7VYYgDgdg4JJUEp2SJXbKn9nrZ5Qapy0om7bdg2TAnEa7iKMbPATi+krAaq2ye
         ruyOCV+I7nbSYTzqqLqPYTFiSPhnO837ueEC43j9dwOlRneUHSP4KphUw5fI7gTAjwEx
         bctSGx0q7v1nNuu3ANrGzV/JMDA/M7HoJCe31BWetRLfYzE8WWPsTeIkXNz9u6UMeZhF
         mebb7vLojjjhFQDHWss1VYYbMpB0YQZU+iuoPQkbS1snboZkA8ZTt7XspW0c8xcJEGEp
         N2fFdaCi2JVJG3olrWVGNPqiHE5kAptmYc/NA/2Gy+2OkM3nlTko5399p6gdpEUnRXhW
         hk7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722102; x=1796326902;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KY418BqW1FceT2VyhopgVkuzgNfxXGz8W25XX/X3PFg=;
        b=heloVbz/9E8GS5TL2p7aDu48jdoiA0DDB7p2iWW7UMe4t7bqoHtn7lasmq1q9MI3M9
         ieX4ehRH4G3N5QrS5e+xCHIzTJdVOyS3n+drSi3WXbpplIFBuMgDiBcBp5Uf1DaCKrPU
         Skp7Jbs5AoygbdjfVKeIG53H760j7TEmFQvMns0sBeWkHd4zKpV7A7JyAFuWVlCQH++U
         B86ne/V1xDCU9g39ka4sTkaySRJl8YkZRXEz2CnVAyPvVjaCnOXFfsltF88TbSXEHU8H
         sC+BEXZR+5jLctjkMDfnvuKUwd84ShhgLHgYWTD332qIeh/jqSdRA7k/ZVBcmrG/mpj/
         aY6g==
X-Forwarded-Encrypted: i=1; AL+hErEKYeTdFrkvWVEEM48aGDGdXArs/qDpF0mhRgzG2w806YZDI/4wjinllEkRaLtNa+FBxZqZlWUxGuG0efs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6xxTcQidkmdnW+kJZicFaWMIi7ePZmchM+YerfqHS60tibJ/j
	imRt5/RhQ8eRmEMM8aJZOP5C/OVoJ6Z1Zo9bE8ZIRQqYSTzGiwNi/IGvh/3NVUfNXT/CvSXaAAW
	k8QLtqkz/3Ig9pTgfp5EFKvOxkvgF1po=
X-Gm-Gg: AZFdTZdB9xBF9gAu9ugyquZDJkFpHjArTaRRcS40X7bXmiZuItmUTtjhc2MSItQK835
	tgnwqtolXeQefJO7KErH7KEG4bZeh71RLAzeVfxv1yqUpcxN6rUSFbL4inESeYt3a0hl3hwKk1n
	XHQuKLkjzeNTZ+M29/z0yLllnzlO1BiIC4KGwUQV/ISiWI6iIB/omqP0SDdjvKRKa2o5mJGcaYp
	/dIP0oK3mDdyziUIqH/V4/P8zLL+A+cDB8tcN/M0G+w7D7K8ln+3DeZRn9gtuuMplhhavVEzHsu
	x827Y/QlDe+srGcT6h0UzcWwpC2f0lAHzimwY2JgfFo+yZx/bPMbfnPRozsJLDTHukn04otMMc4
	J9UCRjtAeXwQQnqubSRvCFVte8r2wSvwsWmxcwSFltV61EJ6WN8YTJ582LqNUneJI7tam
X-Received: by 2002:a05:7022:f516:b0:14c:8461:b3ef with SMTP id
 a92af1059eb24-1b5568fbf43mr18969656c88.24.1795722102378; Thu, 26 Nov 2026
 11:41:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Felipe Infante de Castro <felipe.infante.de.castro@gmail.com>
Date: Thu, 26 Nov 2026 14:41:30 -0500
X-Gm-Features: Aa3M54rUBuYGAkt2yTYL2k7FYSYe9U_fRfgne7iAyAKc4OvpzCeI73Urhf10M0E
Message-ID: <CADy1qsZ_j7FnfZHQnwqFWiQKyxoQGLt+LJKG=Y-63Yi71uiNZQ@mail.gmail.com>
Subject: [PATCH v2] PCI: dwc: Skip the empty CFG1 window for a two-bus ECAM range
To: mani@kernel.org, jingoohan1@gmail.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, bhelgaas@google.com, robh@kernel.org
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000000785380661332261"

--0000000000000785380661332261
Content-Type: text/plain; charset="UTF-8"



--0000000000000785380661332261
Content-Type: application/x-patch; 
	name="v2-0001-PCI-dwc-Skip-the-empty-CFG1-window-for-a-two-bus-ECA.patch"
Content-Disposition: attachment; 
	filename="v2-0001-PCI-dwc-Skip-the-empty-CFG1-window-for-a-two-bus-ECA.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mwxyj5nv0>
X-Attachment-Id: f_mwxyj5nv0

RnJvbSAzOTk4YmI2YzZmOTY1Y2NjOWI1ZWFkNGZkN2MyZTc4NjJmYTUxM2Q1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGZWxpcGUgSW5mYW50ZSBkZSBDYXN0cm8gPGZlbGlwZS5pbmZh
bnRlLmRlLmNhc3Ryb0BnbWFpbC5jb20+CkRhdGU6IFRodSwgMjYgTm92IDIwMjYgMTM6NTQ6MDEg
LTA1MDAKU3ViamVjdDogW1BBVENIIHYyXSBQQ0k6IGR3YzogU2tpcCB0aGUgZW1wdHkgQ0ZHMSB3
aW5kb3cgZm9yIGEgdHdvLWJ1cyBFQ0FNIHJhbmdlCgpXaXRoIHRoZSBpQVRVLWJhc2VkIEVDQU0g
bWVjaGFuaXNtIGFuZCBhIGhvc3QgYnVzIHJlc291cmNlIG9mIFtidXMgMDAtMDFdCihidXMtcmFu
Z2UgPSA8MCAxPiBpbiBhIGRldmljZSB0cmVlKSwgZHdfcGNpZV9jb25maWdfZWNhbV9pYXR1KCkg
cHJvZ3JhbXMKdGhlIENGRzAgd2luZG93IGZvciBidXMgMSBhbmQgdGhlbiByZXF1ZXN0cyBhIENG
RzEgd2luZG93IG9mIHplcm8gYnl0ZXM6CgogIGF0dS5zaXplID0gKFNaXzFNICogYnVzX3Jhbmdl
X21heCkgLSBTWl8yTTsKCmR3X3BjaWVfcHJvZ19vdXRib3VuZF9hdHUoKSByZWplY3RzIGEgemVy
by1zaXplIHdpbmRvdyB3aXRoIC1FSU5WQUwsIHRoZQplcnJvciBwcm9wYWdhdGVzIHRocm91Z2gg
ZHdfcGNpZV9ob3N0X2luaXQoKSBhbmQgdGhlIGhvc3QgYnJpZGdlIGlzIG5ldmVyCnJlZ2lzdGVy
ZWQuCgpyZXNvdXJjZV9zaXplKCkgY291bnRzIGJvdGggZW5kcyBvZiB0aGUgcmFuZ2UsIHNvIFti
dXMgMDAtMDFdIGhvbGRzIHR3bwpidXNlcy4gQnVzIDAgdXNlcyB0aGUgREJJIHJlZ2lzdGVycyBh
bmQgYnVzIDEgdXNlcyB0aGUgQ0ZHMCB3aW5kb3cuIEEKQ0ZHMSB3aW5kb3cgaXMgbmVlZGVkIG9u
bHkgZnJvbSBidXMgMiBvbiwgdGhhdCBpcyBmb3IgdGhyZWUgYnVzZXMgb3IKbW9yZS4gVGhlIGVh
cmx5IHJldHVybiB0ZXN0cyAiYnVzX3JhbmdlX21heCA8IDIiLCB3aGljaCBsZXRzIHRoZSB0d28t
YnVzCmNhc2UgdGhyb3VnaC4KClJldHVybiBlYXJseSBmb3IgdHdvIGJ1c2VzIGFzIHdlbGwuCgpU
ZXN0ZWQgYnkgcmVwbGF5aW5nIGR3X3BjaWVfY29uZmlnX2VjYW1faWF0dSgpIGFuZApkd19wY2ll
X3Byb2dfb3V0Ym91bmRfYXR1KCkgaW4gdXNlciBzcGFjZSBhZ2FpbnN0IG1lbW9yeS1iYWNrZWQK
cmVnaXN0ZXJzLCBmb3IgZXZlcnkgYnVzIGNvdW50IGZyb20gMiB0byAyNTYgYXQgdHdvIEVDQU0g
YmFzZXMuIFdpdGhvdXQKdGhlIGNoYW5nZSB0aGUgdHdvLWJ1cyBjYXNlIGZhaWxzIHdpdGggLUVJ
TlZBTDsgd2l0aCBpdCBhbGwgNTEwIGNhc2VzCnBhc3MgYW5kIHRoZSBDRkcxIHdpbmRvdyBmb3Ig
dGhyZWUgb3IgbW9yZSBidXNlcyBpcyB1bmNoYW5nZWQuIE5vdAp0ZXN0ZWQgb24gaGFyZHdhcmUg
d2l0aCBhIHR3by1idXMgcmFuZ2UuCgpGaXhlczogZjZmZDM1N2Y3YWZiICgiUENJOiBkd2M6IFBy
ZXBhcmUgdGhlIGRyaXZlciBmb3IgZW5hYmxpbmcgRUNBTSBtZWNoYW5pc20gdXNpbmcgaUFUVSAn
Q0ZHIFNoaWZ0IEZlYXR1cmUnIikKQXNzaXN0ZWQtYnk6IE9wZW5BSSBDb2RleApBc3Npc3RlZC1i
eTogQ2xhdWRlIEZhYmxlIDUuMgpTaWduZWQtb2ZmLWJ5OiBGZWxpcGUgSW5mYW50ZSBkZSBDYXN0
cm8gPGZlbGlwZS5pbmZhbnRlLmRlLmNhc3Ryb0BnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIGluIHYy
OgotIFJlc2VudCB3aXRoIGFuIGVtcHR5IG1haWwgYm9keS4gdjEgY2FycmllZCBhIGdyZWV0aW5n
IGFuZAogIGEgc2Vjb25kIGNvcHkgb2YgdGhlIGNoYW5nZWxvZyBpbiB0aGUgYm9keSwgd2hpY2gg
dG9vbGluZyBmb2xkZWQKICBpbnRvIHRoZSBjb21taXQgbWVzc2FnZS4gTm8gY2hhbmdlIHRvIHRo
ZSBwYXRjaCBpdHNlbGYuCgogZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253
YXJlLWhvc3QuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVz
aWdud2FyZS1ob3N0LmMgYi9kcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWRlc2lnbndh
cmUtaG9zdC5jCmluZGV4IGJiYjAyNDUuLjBhYjgwNzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGNp
L2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS1ob3N0LmMKKysrIGIvZHJpdmVycy9wY2kv
Y29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWhvc3QuYwpAQCAtNDQ3LDcgKzQ0Nyw3IEBA
IHN0YXRpYyBpbnQgZHdfcGNpZV9jb25maWdfZWNhbV9pYXR1KHN0cnVjdCBkd19wY2llX3JwICpw
cCkKIAogCWJ1c19yYW5nZV9tYXggPSByZXNvdXJjZV9zaXplKGJ1cy0+cmVzKTsKIAotCWlmIChi
dXNfcmFuZ2VfbWF4IDwgMikKKwlpZiAoYnVzX3JhbmdlX21heCA8PSAyKQogCQlyZXR1cm4gMDsK
IAogCS8qIENvbmZpZ3VyZSByZW1haW5pbmcgYnVzZXMgaW4gdHlwZSAxIGlBVFUgY29uZmlndXJh
dGlvbiAqLwotLSAKMi41Ni4xCgo=
--0000000000000785380661332261--
