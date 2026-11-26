Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795722097;
	b=r1dITr5OW0s7Ns/RQUyry0XgO+ONCyqPeNk0SAjzlpRnTYPaY26WHYQk6twcBy3NV/A7
	 Z8mXcZDc1lYyiBNmFLiOXEM50oHFCYusqDKBqkGgJeQFhuhwx3wRkikfEA9SVmgqiMKMA
	 jI6DKXF3klt77Bc7f4CzdBFCkx7mGaIn850TFOfQlCV4aIyHMbsBlKYTpQp9QbGRC+OWZ
	 o2Vdhkeh3Dk95OjCxLCdiAr+zw9HHwu0H0aHn6onq4ecv7iHIW5bI9wDIsK7+FHtgthdi
	 dPhaNG6NmubI02EE4vOTJMm9ieRS950TNFNaH2WHqecaCR+70e/uBG+SBqWpeTaH7oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722097;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=Rqay7A/4uGGgEQYtatqEbsjGfJ6wUJ9Wke28/3j0qOg=;
	b=5I+DZzTEHpgbJzrASq9Cjp58wE4g0Os+hNX5tzg1BkCwBkHLcmD5OKLYiDk5MUNWlsH3
	 yLRMqpCM/HTGD3MKy7kNy13LcrJTHUszwDVQQRJQ9v4+5ox+RCytjND8JHG4F4woADvMk
	 I6zW7dbVi02rrA+uLpKmwsEFjRyUMwnIa3Y3SN8Yw85tlHOFq1/wwB4QjzjZfobhtAZ3Q
	 Lsl1fhfLuZzhOiS9dsLT0HZFSt40I1UYcQ6GU5aOnqkzuFxwzUBz3gTbtMFyFsHrr3Cyj
	 YmAzoKJKpA0lmRevhonWXiyaPqI70yZt3yL2TL6qlO8dEsfoqBT1LpjSyD+SpU9lzuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEzb3NzX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65747606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 19:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65747606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KEzb3NzX
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b563e5cbc3so576120c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 11:41:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795722096; cv=none;
        d=google.com; s=arc-20260327;
        b=h/JjL60uyzZA9Zz+ly1uLiUQrY04hgcZckEANjtK+Q2bSxwfP0oxOVo6cKRIjU0CTi
         vQk2oKpZqOwK1bpHilkTKzTOmkEEU8q38tNv+S+7VDr49ghBpGxBSWIFtSdpADmf5rqs
         HmWe59+W5LM7Qr9kPmBMWlUh8jTX6+p5j+PiLxcaApFD3PuczwzqAUc5gkzg+tvMhjLi
         6PDXpNPpvZq8EZ2iu8RpBs5C2r2o/z8lbC0RwX2mAtLFz0tt8P6a2Ywc3Z7C0rjFvesU
         rp76YI3x4nd3oKTb6irqE29FX32d+LabdQjUCMKxfiVz7imBopiw2uHbEggiPD4LEb5Y
         QRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Rqay7A/4uGGgEQYtatqEbsjGfJ6wUJ9Wke28/3j0qOg=;
        fh=zlvX/QO7NImbxQu2HOYr//6+f2UoQaRvEN+XRnyIGO0=;
        b=FZrNvphqqTRYUvPvH9Yofhox7qqKDyWB8hKB8loHqe4zhRxIOaH0zuFR3LkaWqYUMp
         MmgV4NPtg6ZDriCbn9eybmWewU3q91/os2+IXq6njlPtsIBhpG8Mqv5pywMoUmMGaKFL
         qMoosOH7o6UbSsqZQNOcXg2mKGEJ00TkOE5idPMFArkBkD6X1Cn/el4uDP37kn1n7Vrj
         gC6wW3RbFpLcoAjzrd+KMJVrV14qjPzwsiSlb+p7wN3cJczjc/30c5Hwx4zbC/SLca2x
         3ejPaBCmINcPJJv75scWShVOzm593nRFQ7c3LA1sH41qgLwN0NQVAIAO9TbcjJT2hViW
         4uMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722096; x=1796326896; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rqay7A/4uGGgEQYtatqEbsjGfJ6wUJ9Wke28/3j0qOg=;
        b=KEzb3NzXGJWjygF7d0iFV2zMQkUPb0URVZWiHwQBfOPjeJtds8ukzh4rFXS5sc3GLJ
         C68BkQBS1+GCBI+6R2r6d3lngGplhzKPkl+xKskYGF0fkX+jZwxQ7nJaaui8CX+Fn3K3
         tWlr5k1bPFzQP62R/WkZLgzONFlWtEmskHTva5tmJrEFB0hGHWGOlbZXrtwbOwvgAAuB
         JLTw1dAr+lieT8tnDNCtIwM99+7WyQWZy4ibQX+Vc8PJy/Escusf3Dg+v524k3hSE1dV
         NdY70tPVmsB0UcGKMyF9ZM6VNsvMphbZ4V5NY770ILDPVxNVXIVSTEhlX430yxE8lq0v
         qVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722096; x=1796326896;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rqay7A/4uGGgEQYtatqEbsjGfJ6wUJ9Wke28/3j0qOg=;
        b=G0lmypBE/pqWoROUU5EZ+/2Z8Hn2CQz6WI0YFwgg2vJOGL9t+LhpPBpHXCndkJteWo
         LpNQMqfznLpcRkvwudfAMTZtno/anf7uxfQQ7XMdNHze7N1JRgGm/oKVDbleBQTKCNjM
         Y1NguXYFHcVa/7hc80qcdVmrIp9QdJN/65zxzufiukcHsmycTdPACsliKARQyU23r5S8
         OKSbquSsy+ZiPvN2nlWdsXQS2/CieqHkVWp6AAFhaQXx+9iF6L0kXmXKIv5+Y6IjezNG
         ANyI81sNwsn8VT6MYywfpBT2I68ygnaU370zVprbxrkpF+yf8dZjtyhSe93fYcGYwJs+
         euJQ==
X-Forwarded-Encrypted: i=1; AL+hErFYYzgFr+QxBgwToLQiTrftZgzWC89JmSzZRUgU7X3RPfo9GRiFQO+GhqT7HbNyEeInCSg7fR+L7dlks+U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k5bMu+r7V493pBCM0n0SRMPhN010E+Gz10bgJkof8+IawKVPk
	snRkBK8ThkcygqdksVkZ79sZNf41tFnG1xcPymgBs7dA/BJs7p6KbMl/g4KZW99oK1T4iKNsAu+
	NXQOso8Wr9A5W9XewcB0/U50UND3Esl0=
X-Gm-Gg: AZFdTZfb3taqu3U86Z8t80XWVJuDBmCPvPyZxnb2ULJJaNPqsOkYo0XUIbz9ffPsv2L
	mUZkheKKrtU89QIzbuK4YEFQKxzgVpSe0/qXoNiaCPpFUKn4AUXV4+fHKZK+d06LK0on5am6B9u
	ijPn1d1UaYWbgS67bFMY1LSzo8xpHmCtLtNaZY8Y0Za7YwcaS7Zu2jEnpj2TyNhBpUzjNsAAgUw
	4JyCZRhnCLOru4hw/gfV9ewbJHIKwizxNEmPjwxvsZt1dC5n9QzGHVX5lGqnoMRmACdcomA8X3z
	CJu5eXEmr0w0YPMp46yocoRXFkUda2R8VXmSO5c2N3K2XPyLxT9AmjnWqeMlq9c3OjFk8xXuo9m
	/QeegM+LCYWWLNdLFt3fDVFb2sVnRhWpFXI5J79gdUfBAffbZoOP31EqxCmSz8IiNaghb
X-Received: by 2002:a05:7022:4181:b0:14a:a6dc:9cbf with SMTP id
 a92af1059eb24-1b5568abf0bmr30663189c88.4.1795722096330; Thu, 26 Nov 2026
 11:41:36 -0800 (PST)
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
Date: Thu, 26 Nov 2026 14:41:24 -0500
X-Gm-Features: Aa3M54pJxIIkH-GEQTPHzaRGVBiiU75p0yF8Jc3oGMLih6NmN3hWxodoQ9iH0uQ
Message-ID: <CADy1qsZaucfiZPbMkLaXE=_i6enEAoHexHMVAJk0UGzZJNV8hA@mail.gmail.com>
Subject: [PATCH v2] usb: dwc3: qcom: Restore DP/DM wake IRQ trigger types on unbind
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000ab4d840661332156"

--000000000000ab4d840661332156
Content-Type: text/plain; charset="UTF-8"



--000000000000ab4d840661332156
Content-Type: application/x-patch; 
	name="v2-0001-usb-dwc3-qcom-Restore-DP-DM-wake-IRQ-trigger-types-o.patch"
Content-Disposition: attachment; 
	filename="v2-0001-usb-dwc3-qcom-Restore-DP-DM-wake-IRQ-trigger-types-o.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mwxyimdx0>
X-Attachment-Id: f_mwxyimdx0

RnJvbSBlYmQ1MDZhODRkM2MyMmIzZmYyNmFhMjY5NjBhNDYzNTE5ZjliMWNlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBGZWxpcGUgSW5mYW50ZSBkZSBDYXN0cm8gPGZlbGlwZS5pbmZh
bnRlLmRlLmNhc3Ryb0BnbWFpbC5jb20+CkRhdGU6IFRodSwgMjYgTm92IDIwMjYgMTM6NTQ6MDEg
LTA1MDAKU3ViamVjdDogW1BBVENIIHYyXSB1c2I6IGR3YzM6IHFjb206IFJlc3RvcmUgRFAvRE0g
d2FrZSBJUlEgdHJpZ2dlciB0eXBlcyBvbgogdW5iaW5kCgpPbiBzdXNwZW5kLCBkd2MzX3Fjb21f
ZW5hYmxlX3dha2V1cF9pcnEoKSBzZXRzIHRoZSBEUCBhbmQgRE0gaGlnaC1zcGVlZApQSFkgaW50
ZXJydXB0cyB0byBhIHNpbmdsZSBlZGdlLCBjaG9zZW4gZnJvbSB0aGUgc3BlZWQgb2YgdGhlIGF0
dGFjaGVkCmRldmljZS4gVGhlIElSUSBtYXBwaW5nIG91dGxpdmVzIHRoZSBkcml2ZXIsIHNvIGFm
dGVyIGFuIHVuYmluZCB0aGUKbWFwcGluZyBrZWVwcyB0aGF0IHNpbmdsZS1lZGdlIHR5cGUuCgpP
biB0aGUgbmV4dCBwcm9iZSB0aGUgaW50ZXJydXB0IGlzIGxvb2tlZCB1cCBhZ2FpbiBmcm9tIHRo
ZSBkZXZpY2UgdHJlZSwKd2hpY2ggZGVzY3JpYmVzIGl0IGFzIElSUV9UWVBFX0VER0VfQk9USC4g
VGhlIGxvb2t1cCBmYWlscyB3aXRoIGEKdHJpZ2dlciB0eXBlIG1pc21hdGNoIGFnYWluc3QgdGhl
IGV4aXN0aW5nIG1hcHBpbmcuIEJlY2F1c2UgdGhlIHdha2UKaW50ZXJydXB0cyBhcmUgb3B0aW9u
YWwsIHByb2JlIHN0aWxsIHN1Y2NlZWRzLCBidXQgd2l0aG91dCB0aGUgRFAvRE0Kd2FrZSBoYW5k
bGVycywgYW5kIFVTQiB3YWtldXAgaXMgbG9zdCB1bnRpbCB0aGUgbmV4dCBib290LgoKUmVjb3Jk
IHRoZSB0cmlnZ2VyIHR5cGUgb2YgZWFjaCBEUC9ETSBpbnRlcnJ1cHQgd2hlbiBpdCBpcyByZXF1
ZXN0ZWQgYW5kCnJlc3RvcmUgaXQgZnJvbSBhIGRldnJlcyBhY3Rpb24uIFRoZSBhY3Rpb24gaXMg
cmVnaXN0ZXJlZCBhZnRlciB0aGUKaW50ZXJydXB0cywgc28gaXQgcnVucyB3aGlsZSB0aGUgZHJp
dmVyIHN0aWxsIG93bnMgdGhlbS4gVW5tYXBwZWQKaW50ZXJydXB0cywgdW5zcGVjaWZpZWQgdHlw
ZXMgYW5kIHR5cGVzIHRoYXQgYWxyZWFkeSBtYXRjaCBhcmUgbGVmdAphbG9uZS4KClNlZW4gb24g
YSBNaWNyb3NvZnQgU3VyZmFjZSBMYXB0b3AgNyAoeDFlODAxMDAtbWljcm9zb2Z0LXJvbXVsdXMx
NSkgb24gYQo3LjMga2VybmVsOiBhZnRlciB1bmJpbmRpbmcgYW5kIHJlYmluZGluZyBhIGNvbnRy
b2xsZXIgdGhlIGRwX2hzX3BoeV9pcnEKYW5kIGRtX2hzX3BoeV9pcnEgaGFuZGxlcnMgd2VyZSBh
YnNlbnQgZnJvbSAvcHJvYy9pbnRlcnJ1cHRzLiBXaXRoIHRoaXMKY2hhbmdlIHRoZXkgcmV0dXJu
IG9uIGV2ZXJ5IHJlYmluZC4KCkZpeGVzOiA2ODk1ZWE1NWMzODUgKCJ1c2I6IGR3YzM6IHFjb206
IENvbmZpZ3VyZSB3YWtldXAgaW50ZXJydXB0cyBkdXJpbmcgc3VzcGVuZCIpCkFzc2lzdGVkLWJ5
OiBPcGVuQUkgQ29kZXgKQXNzaXN0ZWQtYnk6IENsYXVkZSBGYWJsZSA1LjIKU2lnbmVkLW9mZi1i
eTogRmVsaXBlIEluZmFudGUgZGUgQ2FzdHJvIDxmZWxpcGUuaW5mYW50ZS5kZS5jYXN0cm9AZ21h
aWwuY29tPgotLS0KQ2hhbmdlcyBpbiB2MjoKLSBSZXNlbnQgd2l0aCBhbiBlbXB0eSBtYWlsIGJv
ZHkuIHYxIGNhcnJpZWQgYSBncmVldGluZyBhbmQKICBhIHNlY29uZCBjb3B5IG9mIHRoZSBjaGFu
Z2Vsb2cgaW4gdGhlIGJvZHksIHdoaWNoIHRvb2xpbmcgZm9sZGVkCiAgaW50byB0aGUgY29tbWl0
IG1lc3NhZ2UuCi0gQWRkZWQgdGhlIEZpeGVzIHRhZyBzdWdnZXN0ZWQgYnkgdGhlIFNhc2hpa28g
cmV2aWV3LiBObyBjaGFuZ2UgdG8gdGhlCiAgY29kZS4KCiBkcml2ZXJzL3VzYi9kd2MzL2R3YzMt
cWNvbS5jIHwgMzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUg
Y2hhbmdlZCwgMzcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvdXNiL2R3YzMvZHdjMy1xY29tLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtcWNvbS5j
CmluZGV4IGEyNjA4NDEuLjMzOTJhNWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdXNiL2R3YzMvZHdj
My1xY29tLmMKKysrIGIvZHJpdmVycy91c2IvZHdjMy9kd2MzLXFjb20uYwpAQCAtNjUsNiArNjUs
OCBAQCBzdHJ1Y3QgZHdjM19xY29tX3BvcnQgewogCWludAkJCWRwX2hzX3BoeV9pcnE7CiAJaW50
CQkJZG1faHNfcGh5X2lycTsKIAlpbnQJCQlzc19waHlfaXJxOworCXVuc2lnbmVkIGludAkJZHBf
aHNfaXJxX3R5cGU7CisJdW5zaWduZWQgaW50CQlkbV9oc19pcnFfdHlwZTsKIAllbnVtIHVzYl9k
ZXZpY2Vfc3BlZWQJdXNiMl9zcGVlZDsKIH07CiAKQEAgLTQ3Myw2ICs0NzUsNyBAQCBzdGF0aWMg
aW50IGR3YzNfcWNvbV9zZXR1cF9wb3J0X2lycShzdHJ1Y3QgZHdjM19xY29tICpxY29tLAogCQlp
ZiAocmV0KQogCQkJcmV0dXJuIHJldDsKIAkJcWNvbS0+cG9ydHNbcG9ydF9pbmRleF0uZHBfaHNf
cGh5X2lycSA9IGlycTsKKwkJcWNvbS0+cG9ydHNbcG9ydF9pbmRleF0uZHBfaHNfaXJxX3R5cGUg
PSBpcnFfZ2V0X3RyaWdnZXJfdHlwZShpcnEpOwogCX0KIAogCWlmIChpc19tdWx0aXBvcnQpCkBA
IC00ODgsNiArNDkxLDcgQEAgc3RhdGljIGludCBkd2MzX3Fjb21fc2V0dXBfcG9ydF9pcnEoc3Ry
dWN0IGR3YzNfcWNvbSAqcWNvbSwKIAkJaWYgKHJldCkKIAkJCXJldHVybiByZXQ7CiAJCXFjb20t
PnBvcnRzW3BvcnRfaW5kZXhdLmRtX2hzX3BoeV9pcnEgPSBpcnE7CisJCXFjb20tPnBvcnRzW3Bv
cnRfaW5kZXhdLmRtX2hzX2lycV90eXBlID0gaXJxX2dldF90cmlnZ2VyX3R5cGUoaXJxKTsKIAl9
CiAKIAlpZiAoaXNfbXVsdGlwb3J0KQpAQCAtNTQwLDYgKzU0NCwzOCBAQCBzdGF0aWMgaW50IGR3
YzNfcWNvbV9maW5kX251bV9wb3J0cyhzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXJl
dHVybiBEV0MzX1FDT01fTUFYX1BPUlRTOwogfQogCitzdGF0aWMgdm9pZCBkd2MzX3Fjb21fcmVz
dG9yZV9pcnFfdHlwZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGludCBpcnEsIHVuc2lnbmVkIGludCB0
eXBlKQoreworCWludCByZXQ7CisKKwlpZiAoIWlycSB8fCAhdHlwZSB8fCBpcnFfZ2V0X3RyaWdn
ZXJfdHlwZShpcnEpID09IHR5cGUpCisJCXJldHVybjsKKworCXJldCA9IGlycV9zZXRfaXJxX3R5
cGUoaXJxLCB0eXBlKTsKKwlpZiAocmV0KQorCQlkZXZfd2FybihkZXYsICJmYWlsZWQgdG8gcmVz
dG9yZSBJUlEgJWQgdHJpZ2dlciB0eXBlICUjeDogJWRcbiIsCisJCQkgaXJxLCB0eXBlLCByZXQp
OworfQorCitzdGF0aWMgdm9pZCBkd2MzX3Fjb21fcmVzdG9yZV93YWtlX2lycV90eXBlcyh2b2lk
ICpkYXRhKQoreworCXN0cnVjdCBkd2MzX3Fjb20gKnFjb20gPSBkYXRhOworCWludCBpOworCisJ
LyoKKwkgKiBUaGUgSVJRIG1hcHBpbmdzIHN1cnZpdmUgdW5iaW5kLiBQdXQgdGhlaXIgZmlybXdh
cmUgdHJpZ2dlcnMgYmFjaworCSAqIGJlZm9yZSBkZXZyZXMgZnJlZXMgdGhlIGhhbmRsZXJzIG9y
IHRoZSBuZXh0IHByb2JlIGNhbiBsb3NlIHRoZW0uCisJICovCisJZm9yIChpID0gMDsgaSA8IHFj
b20tPm51bV9wb3J0czsgaSsrKSB7CisJCXN0cnVjdCBkd2MzX3Fjb21fcG9ydCAqcG9ydCA9ICZx
Y29tLT5wb3J0c1tpXTsKKworCQlkd2MzX3Fjb21fcmVzdG9yZV9pcnFfdHlwZShxY29tLT5kZXYs
IHBvcnQtPmRwX2hzX3BoeV9pcnEsCisJCQkJCSAgIHBvcnQtPmRwX2hzX2lycV90eXBlKTsKKwkJ
ZHdjM19xY29tX3Jlc3RvcmVfaXJxX3R5cGUocWNvbS0+ZGV2LCBwb3J0LT5kbV9oc19waHlfaXJx
LAorCQkJCQkgICBwb3J0LT5kbV9oc19pcnFfdHlwZSk7CisJfQorfQorCiBzdGF0aWMgaW50IGR3
YzNfcWNvbV9zZXR1cF9pcnEoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSwgc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIHsKIAlib29sIGlzX211bHRpcG9ydDsKQEAgLTU1NSw3ICs1OTEsNyBA
QCBzdGF0aWMgaW50IGR3YzNfcWNvbV9zZXR1cF9pcnEoc3RydWN0IGR3YzNfcWNvbSAqcWNvbSwg
c3RydWN0IHBsYXRmb3JtX2RldmljZSAqcAogCQkJcmV0dXJuIHJldDsKIAl9CiAKLQlyZXR1cm4g
MDsKKwlyZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHFjb20tPmRldiwgZHdjM19xY29t
X3Jlc3RvcmVfd2FrZV9pcnFfdHlwZXMsIHFjb20pOwogfQogCiBzdGF0aWMgdm9pZCBkd2MzX3Fj
b21fc2V0X3JvbGVfbm90aWZpZXIoc3RydWN0IGR3YzMgKmR3YywgZW51bSB1c2Jfcm9sZSBuZXh0
X3JvbGUpCi0tIAoyLjU2LjEKCg==
--000000000000ab4d840661332156--
