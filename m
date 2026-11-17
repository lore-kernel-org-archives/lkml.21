Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794944910;
	b=vBlkx6Csp928C3jBUAs+mu7MdAx4lKjhdSYbkM3CNFSWTg0M8r0qqfighZfnRjbVd2rh
	 4nv0seU/41+BCJdmmXI2Fmu0/BwEfgz3mwWFqU/s52z57vbh9O/xjWmwuSnOiQzLiirtg
	 YWBczJfkSt7muLMN7LuiZoIbPCmUcVJ7wwDAc+J56xdpV1gsdJXnohNQIqigCaUpEZYRO
	 LxxHL4It8QF4p9TQ3F1eD61cLPdUPAh556/AMzeZ9x9/fIJ8LCkeDJcdpQQ/C5wVPwjGG
	 bVfbI5bc0wA2Uo1TopWig0qsw5nKDosLyplFMMni8c2mlsXM3g4VCqhddpyHnEyIrzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794944910;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=pz8l3qiBqUBWhr0HS/plvY5iqW0Uso2hEdf4B7cUURE=;
	b=cm3A2amBsUeBxZrPknq5k0R0fGzs41+QXHS0a1xUlM3tkia5zKitWHB+2Ts1lU9BLpHl
	 hLkqJn5oO4JkoKfbUDOfCAr3jIuaBpIlENE+y1Vp6xYi9jJJaEkAc/JFpM/0/T36Ziukd
	 ocv7Qv97JqEss8+piukfsn4iyhF9s3CiOiay4toJi0/h10YVLEdJO67YYPB9dE+pzZGnL
	 D45QwODHAh7wPMYPFNXyE846QxmgPqKGRVFywgE66Yipl7LCUxhrjohg8AcPndwf42Lcg
	 0s7PdxCZdE1gVE5MSRj9nCtq9gK/GCrEbLrsOqsLH2N87z9Wzh4r0qlrJN2fMzD4/1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Z93S1G6p;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B676C606A331
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 19:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B676C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Z93S1G6p
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6b75712fb57so336029a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794944908; x=1795549708; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pz8l3qiBqUBWhr0HS/plvY5iqW0Uso2hEdf4B7cUURE=;
        b=Z93S1G6pNutL+DD0aJ6cHI2zHuVSDAI0bbWkByb0b1yOc+6hCghvvPe7DuyyVT75N9
         ZAgprJoNRtoj55TkgS5P1uI5cIf0FDUGPCicD96NReny62NYe/805W14EUufA+sV6/v7
         KLAGxCO96zqVJicJtWY/aWOIWUoQU89B4pNYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794944908; x=1795549708;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pz8l3qiBqUBWhr0HS/plvY5iqW0Uso2hEdf4B7cUURE=;
        b=KPPY1QMiug2GlzaI2AV2S05mXzvod+6ctHmkdAl4rALrMv+rCF0ZsFOafX0n71MkoJ
         xxc0PrCtij4cxz9Vw2RCjkrrLNTKBESaJFK27NWnBVejHUeofuu4PrRR8IV7Fqnp/cr3
         Igb8i6y2gsXIXFdVCOi2ONKuBDY7q7BrbJcdniSeEMFqdsvGhqttrYJr2qXxNWdZyiRQ
         0DmiNeI+f7HbOsVJ55ugJSJZ5ke9XqHb8WaT+WdnS26suhgIa+TUfDrkzG5rcxmQvsKn
         jCdqHkp4wlHzZhNjWY25sy61yVNDC/oqhKAhpVEOV9JSAz2Z2IVucb95HgsmkubbcNey
         piXQ==
X-Forwarded-Encrypted: i=1; AL+hErGPK6Cyzlczh3YLVLs+PRUgKHHEnVDVF0WTFnQ4kb1dR7EbA8/5kOOALDUeUsowVEDnCbPeGfLurm3prEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z90cOpaaWRP06gQzBRB+As2MO9bXQBZexKLczYmbtOzQF/cJkJ0
	fiF5Ec/k/NYeEOyIkLfuMlfmYTKDkWTPoczZs83Yv+8X7TRwP6RI062L/dRBYzGbzgJkcM3la/w
	bjh72O2TZLQ==
X-Gm-Gg: AYBFou0+/V004ELaSTS8HgJCJy100I/4Oi+FSGkjJ9XQwz0Xkghwx5wxPmlw+Mxto+x
	Azjdp2Ep5iz78DvJkK+doD9l1VufMUKE8SgD4jH02XMoUOGNtEIW7QYrzYl5WVfdAvu5+L1eM57
	O7hyuJ6wOlIZG5UBtM5J0xORH5MvikeBYvbcLVklXYkRNwjwZ5aKtc4p61yQ9hEggIkATy4MpqN
	exZfrsxieA6wO5oWY79v9wX4vHjM85QHN/kgiV48ccuHlkPFrVM8ip82equfNziUuLXx3uzkaq3
	JzgpUZgRg0UTwsGFJp7yG6Pw9Wu2/logt/esJxSVKetAN8oPRQLC2q8eqNRt52icIPIYrZ8L9W1
	fhPO9uoWanKWkT5FsV7LiubhHS9HLQ9YC6UlPNkzeT+XSeyPkMQK6DBzccnV2dDURy16mTYw/Nc
	EDY1pDumim2ZNcVdMVYyZumi3g2V4LDzpzjDqsNw0CH82FfC5DE0VGsw/L/CWpH9S4ChRwfUK6+
	5lvtdCW9iDFGIvG8CcnsNIWl1ohTMR1db7EZpM6yI3zgNzNJZy/NkinrJ9z97JUitHzvJVM/b2U
	wl4ipVQcn3uNse5vV9s3ClPYHVMNPrk/XX1bT/+5l+IDAdH0gw7jMOipH6fUfnJ8j+OhYkUfzXh
	KfxM=
X-Received: by 2002:a05:6402:450e:b0:6b5:8cd0:4046 with SMTP id 4fb4d7f45d1cf-6b887e99f16mr258212a12.16.1794944907690;
        Tue, 17 Nov 2026 11:48:27 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88993eba3sm60012a12.13.2026.11.17.11.48.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:48:26 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so11304266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:48:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEyeHRog9u/aULCN3WLlsfhYqnODGl1FxFlhHIMsp4PhKATQQ5Z/tRGFS75Y95W/MjFgHrZzwfAwiwYEwE=@vger.kernel.org
X-Received: by 2002:a17:906:c141:b0:c3f:55e6:83e6 with SMTP id
 a640c23a62f3a-c510e22a312mr23480066b.15.1794944905938; Tue, 17 Nov 2026
 11:48:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111-pipe-epollexclusive-wakeup-v1-1-0af6283e9fda@columbia.edu>
 <avxWKI795DthE8Sb@redhat.com> <CAHk-=wjOq+G=6gte4vX_YxOD_VfE1uZh7=+KHs8N0wU75xyHEg@mail.gmail.com>
 <avyODoFhZ_M7YDU5@redhat.com> <CAHk-=wgcBSBtHE+3ceKGjq1jyF64OyoEqf5JPpixowAa80GqNQ@mail.gmail.com>
 <avyVwg-5ef-pXZkG@redhat.com> <CAHk-=wjJF8uZLfVbbqei9-fhs9K70i2OnVreCV-rQF9EGKAxJg@mail.gmail.com>
In-Reply-To: <CAHk-=wjJF8uZLfVbbqei9-fhs9K70i2OnVreCV-rQF9EGKAxJg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Nov 2026 11:48:09 -0800
X-Gmail-Original-Message-ID: <CAHk-=wjqParwoB8wb9KfGVpbwUwvKvObpLOo=XPM0GGfkn3ibw@mail.gmail.com>
X-Gm-Features: AclHuK_utMadaL_dZX_sEFGqmttVnRSlgsZcdf_Rq4dgHcJ507Z8LlKBWadx-x0
Message-ID: <CAHk-=wjqParwoB8wb9KfGVpbwUwvKvObpLOo=XPM0GGfkn3ibw@mail.gmail.com>
Subject: Re: [PATCH] pipe: keep per-write wakeups for EPOLLEXCLUSIVE consumers
To: Oleg Nesterov <oleg@redhat.com>
Cc: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>, 
	Breno Leitao <leitao@debian.org>, Christian Brauner <brauner@kernel.org>, 
	Mateusz Guzik <mjguzik@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tz2294@columbia.edu, stable@vger.kernel.org, 
	Mani Tofigh <mt4022@columbia.edu>
Content-Type: multipart/mixed; boundary="00000000000082d9da06607e2d62"

--00000000000082d9da06607e2d62
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Nov 2026 at 11:12, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Ok, I looked at this, and it gets ugly

Side note: as part of looking at it, I did look at what it would
involve in our wait.h infrastructure.

That header isn't _horrible_, but some of it was uglier than needed,
and adding WQ_FLAG_PRIORITY would have been a huge pain because the
code unnecessarily special-cases WQ_FLAG_EXCLUSIVE.

So while I threw the rest of my trial patch away, this patch remained
as a cleanup. It *looks* sane to me, and I think the end result looks
better and would be more flexible.

For example, it would have allowed just adding a new user of
___wait_event() that used WQ_FLAG_PRIORITY to put itself at the head
of the queue.

NOTE! Entirely untested. Comments?

              Linus

--00000000000082d9da06607e2d62
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0001-wait-event-clean-up-the-internal-helper-arguments.patch"
Content-Disposition: attachment; 
	filename="0001-wait-event-clean-up-the-internal-helper-arguments.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mwl3u5430>
X-Attachment-Id: f_mwl3u5430

RnJvbSBjOGY2MGQ2NzBmYTEyMTVjZTVjZDM4ZjljN2U3Y2IyNzU4YmM1YTU4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRh
dGlvbi5vcmc+CkRhdGU6IFR1ZSwgMTcgTm92IDIwMjYgMTE6NDI6MDMgLTA4MDAKU3ViamVjdDog
W1BBVENIXSB3YWl0LWV2ZW50OiBjbGVhbiB1cCB0aGUgaW50ZXJuYWwgaGVscGVyIGFyZ3VtZW50
cwoKVGhlIF9fX3dhaXRfZXZlbnQoKSBoZWxwZXIgZm9yIGhpc3RvcmljYWwgcmVhc29ucyB0b29r
IGEgIjAvMSIgYXJndW1lbnQKZm9yIHdoZXRoZXIgdGhlIHdhaXQtcXVldWUgZW50cnkgc2hvdWxk
IGJlIG1hcmtlZCBXUV9GTEFHX0VYQ0xVU0lWRSBvcgpub3QuICBUaGF0IGRpZG4ndCByZWFsbHkg
aGVscCByZWFkYWJpbGl0eSwgYnV0IGl0IGFsc28gbGltaXRlZCB0aGUKd3FfZmxhZ3MgZm9yIHRo
YXQgaGVscGVyIHRvIG9ubHkgdGhhdCBvbmUgZmxhZy4KCkp1c3QgbWFrZSB0aGF0IG1hY3JvIGFy
Z3VtZW50IGJlIHRoZSBhY3R1YWwgJ3dxX2ZsYWdzJyB2YWx1ZSwgd2hpY2gKc2ltcGxpZmllcyB0
aGUgaGVscGVyLCBhbmQgbWFrZXMgaXQgbW9yZSBnZW5lcmljLiAgSXQgYWxzbyBoYXBwZW5zIHRv
Cm1ha2UgdGhlIHVzZXJzIG9mIHRoaXMgbWFjcm8gbW9yZSBvYnZpb3VzIHdoZW4gYW4gdW5leHBs
YWluZWQgJzEnCmFyZ3VtZW50IGJlY29tZXMgYSBtb3JlIHNlbGYtZXhwbGFuYXRvcnkgJ1dRX0ZM
QUdfRVhDTFVTSVZFJy4KCkFsc28gY2hhbmdlIHRoZSBleGlzdGluZyB1c2VycyB0aGF0IHVzZSB0
aGF0IHJhdyBfX193YWl0X2V2ZW50KCkKaW50ZXJmYWNlIHdpdGgganVzdCBhIHBsYWluIHNjaGVk
dWxlKCkgdG8gdXNlIHRoZSBwcmUtZXhpc3RpbmcgaGVscGVycwptYWNyb3M6IF9fd2FpdF9ldmVu
dF9zdGF0ZSgpIGFuZCBfX3dhaXRfZXZlbnRfc3RhdGVfZXhjbHVzaXZlKCkuCgpTaWduZWQtb2Zm
LWJ5OiBMaW51cyBUb3J2YWxkcyA8dG9ydmFsZHNAbGludXgtZm91bmRhdGlvbi5vcmc+Ci0tLQog
aW5jbHVkZS9saW51eC93YWl0LmggfCAzNiArKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAyMSBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3dhaXQuaCBiL2luY2x1ZGUvbGludXgvd2FpdC5o
CmluZGV4IGMyYWY5OGIwMDc0ZC4uYjNlOTRjNzFjZDNlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L3dhaXQuaAorKysgYi9pbmNsdWRlL2xpbnV4L3dhaXQuaApAQCAtMjk5LDEzICsyOTksMTMg
QEAgZXh0ZXJuIHZvaWQgaW5pdF93YWl0X2VudHJ5KHN0cnVjdCB3YWl0X3F1ZXVlX2VudHJ5ICp3
cV9lbnRyeSwgaW50IGZsYWdzKTsKICAqIG90aGVyd2lzZS4KICAqLwogCi0jZGVmaW5lIF9fX3dh
aXRfZXZlbnQod3FfaGVhZCwgY29uZGl0aW9uLCBzdGF0ZSwgZXhjbHVzaXZlLCByZXQsIGNtZCkJ
CVwKKyNkZWZpbmUgX19fd2FpdF9ldmVudCh3cV9oZWFkLCBjb25kaXRpb24sIHN0YXRlLCB3cV9m
bGFnLCByZXQsIGNtZCkJCVwKICh7CQkJCQkJCQkJCVwKIAlfX2xhYmVsX18gX19vdXQ7CQkJCQkJ
CVwKIAlzdHJ1Y3Qgd2FpdF9xdWV1ZV9lbnRyeSBfX3dxX2VudHJ5OwkJCQkJXAogCWxvbmcgX19y
ZXQgPSByZXQ7CS8qIGV4cGxpY2l0IHNoYWRvdyAqLwkJCQlcCiAJCQkJCQkJCQkJXAotCWluaXRf
d2FpdF9lbnRyeSgmX193cV9lbnRyeSwgZXhjbHVzaXZlID8gV1FfRkxBR19FWENMVVNJVkUgOiAw
KTsJXAorCWluaXRfd2FpdF9lbnRyeSgmX193cV9lbnRyeSwgd3FfZmxhZyk7CQkJCQlcCiAJZm9y
ICg7OykgewkJCQkJCQkJXAogCQlsb25nIF9faW50ID0gcHJlcGFyZV90b193YWl0X2V2ZW50KCZ3
cV9oZWFkLCAmX193cV9lbnRyeSwgc3RhdGUpO1wKIAkJCQkJCQkJCQlcCkBAIC0zMjcsOCArMzI3
LDcgQEAgX19vdXQ6CV9fcmV0OwkJCQkJCQkJCVwKIH0pCiAKICNkZWZpbmUgX193YWl0X2V2ZW50
KHdxX2hlYWQsIGNvbmRpdGlvbikJCQkJCVwKLQkodm9pZClfX193YWl0X2V2ZW50KHdxX2hlYWQs
IGNvbmRpdGlvbiwgVEFTS19VTklOVEVSUlVQVElCTEUsIDAsIDAsCVwKLQkJCSAgICBzY2hlZHVs
ZSgpKQorCSh2b2lkKV9fd2FpdF9ldmVudF9zdGF0ZSh3cV9oZWFkLCBjb25kaXRpb24sIFRBU0tf
VU5JTlRFUlJVUFRJQkxFKQogCiAvKioKICAqIHdhaXRfZXZlbnQgLSBzbGVlcCB1bnRpbCBhIGNv
bmRpdGlvbiBnZXRzIHRydWUKQEAgLTM2Niw4ICszNjUsNyBAQCBkbyB7CQkJCQkJCQkJCVwKIH0g
d2hpbGUgKDApCiAKICNkZWZpbmUgX193YWl0X2V2ZW50X2ZyZWV6YWJsZSh3cV9oZWFkLCBjb25k
aXRpb24pCQkJCVwKLQlfX193YWl0X2V2ZW50KHdxX2hlYWQsIGNvbmRpdGlvbiwgKFRBU0tfSU5U
RVJSVVBUSUJMRXxUQVNLX0ZSRUVaQUJMRSksCVwKLQkJCTAsIDAsIHNjaGVkdWxlKCkpCisJX193
YWl0X2V2ZW50X3N0YXRlKHdxX2hlYWQsIGNvbmRpdGlvbiwgKFRBU0tfSU5URVJSVVBUSUJMRXxU
QVNLX0ZSRUVaQUJMRSkpCiAKIC8qKgogICogd2FpdF9ldmVudF9mcmVlemFibGUgLSBzbGVlcCAo
b3IgZnJlZXplKSB1bnRpbCBhIGNvbmRpdGlvbiBnZXRzIHRydWUKQEAgLTQ0Miw4ICs0NDAsOCBA
QCBkbyB7CQkJCQkJCQkJCVwKIH0pCiAKICNkZWZpbmUgX193YWl0X2V2ZW50X2V4Y2x1c2l2ZV9j
bWQod3FfaGVhZCwgY29uZGl0aW9uLCBjbWQxLCBjbWQyKQkJXAotCSh2b2lkKV9fX3dhaXRfZXZl
bnQod3FfaGVhZCwgY29uZGl0aW9uLCBUQVNLX1VOSU5URVJSVVBUSUJMRSwgMSwgMCwJXAotCQkJ
ICAgIGNtZDE7IHNjaGVkdWxlKCk7IGNtZDIpCisJKHZvaWQpX19fd2FpdF9ldmVudCh3cV9oZWFk
LCBjb25kaXRpb24sIFRBU0tfVU5JTlRFUlJVUFRJQkxFLAkJXAorCQkJICAgIFdRX0ZMQUdfRVhD
TFVTSVZFLCAwLCBjbWQxOyBzY2hlZHVsZSgpOyBjbWQyKQogLyoKICAqIEp1c3QgbGlrZSB3YWl0
X2V2ZW50X2NtZCgpLCBleGNlcHQgaXQgc2V0cyBleGNsdXNpdmUgZmxhZwogICovCkBAIC00ODAs
OCArNDc4LDcgQEAgZG8gewkJCQkJCQkJCQlcCiB9IHdoaWxlICgwKQogCiAjZGVmaW5lIF9fd2Fp
dF9ldmVudF9pbnRlcnJ1cHRpYmxlKHdxX2hlYWQsIGNvbmRpdGlvbikJCQkJXAotCV9fX3dhaXRf
ZXZlbnQod3FfaGVhZCwgY29uZGl0aW9uLCBUQVNLX0lOVEVSUlVQVElCTEUsIDAsIDAsCQlcCi0J
CSAgICAgIHNjaGVkdWxlKCkpCisJX193YWl0X2V2ZW50X3N0YXRlKHdxX2hlYWQsIGNvbmRpdGlv
biwgVEFTS19JTlRFUlJVUFRJQkxFKQogCiAvKioKICAqIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJs
ZSAtIHNsZWVwIHVudGlsIGEgY29uZGl0aW9uIGdldHMgdHJ1ZQpAQCAtNjIwLDggKzYxNyw3IEBA
IGRvIHsJCQkJCQkJCQkJXAogfSkKIAogI2RlZmluZSBfX3dhaXRfZXZlbnRfaW50ZXJydXB0aWJs
ZV9leGNsdXNpdmUod3EsIGNvbmRpdGlvbikJCQlcCi0JX19fd2FpdF9ldmVudCh3cSwgY29uZGl0
aW9uLCBUQVNLX0lOVEVSUlVQVElCTEUsIDEsIDAsCQkJXAotCQkgICAgICBzY2hlZHVsZSgpKQor
CV9fd2FpdF9ldmVudF9zdGF0ZV9leGNsdXNpdmUod3EsIGNvbmRpdGlvbiwgVEFTS19JTlRFUlJV
UFRJQkxFKQogCiAjZGVmaW5lIHdhaXRfZXZlbnRfaW50ZXJydXB0aWJsZV9leGNsdXNpdmUod3Es
IGNvbmRpdGlvbikJCQlcCiAoewkJCQkJCQkJCQlcCkBAIC02MzMsOCArNjI5LDcgQEAgZG8gewkJ
CQkJCQkJCQlcCiB9KQogCiAjZGVmaW5lIF9fd2FpdF9ldmVudF9raWxsYWJsZV9leGNsdXNpdmUo
d3EsIGNvbmRpdGlvbikJCQkJXAotCV9fX3dhaXRfZXZlbnQod3EsIGNvbmRpdGlvbiwgVEFTS19L
SUxMQUJMRSwgMSwgMCwJCQlcCi0JCSAgICAgIHNjaGVkdWxlKCkpCisJX193YWl0X2V2ZW50X3N0
YXRlX2V4Y2x1c2l2ZSh3cSwgY29uZGl0aW9uLCBUQVNLX0tJTExBQkxFKQogCiAjZGVmaW5lIHdh
aXRfZXZlbnRfa2lsbGFibGVfZXhjbHVzaXZlKHdxLCBjb25kaXRpb24pCQkJCVwKICh7CQkJCQkJ
CQkJCVwKQEAgLTY0Nyw4ICs2NDIsNyBAQCBkbyB7CQkJCQkJCQkJCVwKIAogCiAjZGVmaW5lIF9f
d2FpdF9ldmVudF9mcmVlemFibGVfZXhjbHVzaXZlKHdxLCBjb25kaXRpb24pCQkJCVwKLQlfX193
YWl0X2V2ZW50KHdxLCBjb25kaXRpb24sIChUQVNLX0lOVEVSUlVQVElCTEV8VEFTS19GUkVFWkFC
TEUpLCAxLCAwLFwKLQkJCXNjaGVkdWxlKCkpCisJX193YWl0X2V2ZW50X3N0YXRlX2V4Y2x1c2l2
ZSh3cSwgY29uZGl0aW9uLCAoVEFTS19JTlRFUlJVUFRJQkxFfFRBU0tfRlJFRVpBQkxFKSkKIAog
I2RlZmluZSB3YWl0X2V2ZW50X2ZyZWV6YWJsZV9leGNsdXNpdmUod3EsIGNvbmRpdGlvbikJCQkJ
XAogKHsJCQkJCQkJCQkJXApAQCAtNjc2LDcgKzY3MCw3IEBAIGRvIHsJCQkJCQkJCQkJXAogZG8g
ewkJCQkJCQkJCQlcCiAJbWlnaHRfc2xlZXAoKTsJCQkJCQkJCVwKIAlpZiAoIShjb25kaXRpb24p
KQkJCQkJCQlcCi0JCV9fX3dhaXRfZXZlbnQod3FfaGVhZCwgY29uZGl0aW9uLCBUQVNLX0lETEUs
IDAsIDAsIHNjaGVkdWxlKCkpOwlcCisJCV9fd2FpdF9ldmVudF9zdGF0ZSh3cV9oZWFkLCBjb25k
aXRpb24sIFRBU0tfSURMRSk7CQlcCiB9IHdoaWxlICgwKQogCiAvKioKQEAgLTcwMCw3ICs2OTQs
NyBAQCBkbyB7CQkJCQkJCQkJCVwKIGRvIHsJCQkJCQkJCQkJXAogCW1pZ2h0X3NsZWVwKCk7CQkJ
CQkJCQlcCiAJaWYgKCEoY29uZGl0aW9uKSkJCQkJCQkJXAotCQlfX193YWl0X2V2ZW50KHdxX2hl
YWQsIGNvbmRpdGlvbiwgVEFTS19JRExFLCAxLCAwLCBzY2hlZHVsZSgpKTsJXAorCQlfX3dhaXRf
ZXZlbnRfc3RhdGVfZXhjbHVzaXZlKHdxX2hlYWQsIGNvbmRpdGlvbiwgVEFTS19JRExFKTsJXAog
fSB3aGlsZSAoMCkKIAogI2RlZmluZSBfX3dhaXRfZXZlbnRfaWRsZV90aW1lb3V0KHdxX2hlYWQs
IGNvbmRpdGlvbiwgdGltZW91dCkJCQlcCkBAIC03MzgsNyArNzMyLDcgQEAgZG8gewkJCQkJCQkJ
CQlcCiAKICNkZWZpbmUgX193YWl0X2V2ZW50X2lkbGVfZXhjbHVzaXZlX3RpbWVvdXQod3FfaGVh
ZCwgY29uZGl0aW9uLCB0aW1lb3V0KQlcCiAJX19fd2FpdF9ldmVudCh3cV9oZWFkLCBfX193YWl0
X2NvbmRfdGltZW91dChjb25kaXRpb24pLAkJCVwKLQkJICAgICAgVEFTS19JRExFLCAxLCB0aW1l
b3V0LAkJCQkJXAorCQkgICAgICBUQVNLX0lETEUsIFdRX0ZMQUdfRVhDTFVTSVZFLCB0aW1lb3V0
LAkJCVwKIAkJICAgICAgX19yZXQgPSBzY2hlZHVsZV90aW1lb3V0KF9fcmV0KSkKIAogLyoqCkBA
IC05MTEsNyArOTA1LDcgQEAgZXh0ZXJuIGludCBkb193YWl0X2ludHJfaXJxKHdhaXRfcXVldWVf
aGVhZF90ICosIHdhaXRfcXVldWVfZW50cnlfdCAqKTsKIAogCiAjZGVmaW5lIF9fd2FpdF9ldmVu
dF9raWxsYWJsZSh3cSwgY29uZGl0aW9uKQkJCQkJXAotCV9fX3dhaXRfZXZlbnQod3EsIGNvbmRp
dGlvbiwgVEFTS19LSUxMQUJMRSwgMCwgMCwgc2NoZWR1bGUoKSkKKwlfX3dhaXRfZXZlbnRfc3Rh
dGUod3EsIGNvbmRpdGlvbiwgVEFTS19LSUxMQUJMRSkKIAogLyoqCiAgKiB3YWl0X2V2ZW50X2tp
bGxhYmxlIC0gc2xlZXAgdW50aWwgYSBjb25kaXRpb24gZ2V0cyB0cnVlCkBAIC05ODEsNyArOTc1
LDcgQEAgZXh0ZXJuIGludCBkb193YWl0X2ludHJfaXJxKHdhaXRfcXVldWVfaGVhZF90ICosIHdh
aXRfcXVldWVfZW50cnlfdCAqKTsKIH0pCiAKICNkZWZpbmUgX193YWl0X2V2ZW50X3N0YXRlX2V4
Y2x1c2l2ZSh3cSwgY29uZGl0aW9uLCBzdGF0ZSkJCQlcCi0JX19fd2FpdF9ldmVudCh3cSwgY29u
ZGl0aW9uLCBzdGF0ZSwgMSwgMCwgc2NoZWR1bGUoKSkKKwlfX193YWl0X2V2ZW50KHdxLCBjb25k
aXRpb24sIHN0YXRlLCBXUV9GTEFHX0VYQ0xVU0lWRSwgMCwgc2NoZWR1bGUoKSkKIAogI2RlZmlu
ZSB3YWl0X2V2ZW50X3N0YXRlX2V4Y2x1c2l2ZSh3cSwgY29uZGl0aW9uLCBzdGF0ZSkJCQlcCiAo
ewkJCQkJCQkJCQlcCi0tIAoyLjU2LjAuMzEzLmc5NzVhNzVjYTkwCgo=
--00000000000082d9da06607e2d62--
