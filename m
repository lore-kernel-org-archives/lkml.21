Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795648697;
	b=E6mX7zlcSKL6WaKyCDVb4kdYbAsAecN9iNU+xYK9F1fl6xFKtHxVrrQjWR31RBwYI79w
	 JrdsNGEeUgt/Am6w+iCgfIRlLon0+UZJIJwvH8pnGckVafVWma36j1EBX3tKFAkbWtFdP
	 p+UxHAC0715s0BOoGnauZF+S6NL97tm1ui7RcF+1LfY2G0vj9v3c8O1NtNJ7vaecsfC9m
	 x38L8G2nKxOrBq/f/PFcoH1gLLuX0bEZFk9S12NRd/FL/ADLJnI1388/Q1glrXs8ApJdK
	 u0uQ5RV4KIsN4Z3cbSn/SLqPycUhotKDiIwFSCMLhkMGu2zh0nGVJsOM/5KwZuVmkpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795648697;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=qwo3J2Ed9L49OeSmosBwhswUwxqHKh4UChRvEyZrMSo=;
	b=kNdp1khbsWhon2hwoHb561GBbaCYH/thIw7/rryo1xK1SYalDov1FEtnVyeYn8RKbT5Q
	 WDnPYlS1DEkOkRhkwic07u3Yzv8SUUsMr0RvBo+PWoq4LIJPsbC0FhBXCdG1t30+BVGkH
	 zHy3xRTCfkxLhdtD80HrlPS7GVfdPiq8/+miMU6okaIqK5s8JQWeb5oVokv+CSc+/Zmfp
	 Dcirc4yNKBDlSPRZexrZ95HXlXn9Ju36IdouYJB5Q4B2HN8njJ7Aa+mBk7vDp+3i6tWNf
	 LkEdrV1tBr5aRuA53u6ImLl/kYsVF4Rt5hPn06VXuo2LFdEliMuBZ93p4o3UA+MyuZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=w34EWhj4;
	arc=none smtp.remote-ip=185.70.43.16
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E238D606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 23:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E238D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=w34EWhj4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1795648694; x=1795907894;
	bh=qwo3J2Ed9L49OeSmosBwhswUwxqHKh4UChRvEyZrMSo=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=w34EWhj4wU6gkSi2HDa7QgSm+niy4dkABvCsgvkWn8DrDd5ZgkDvHmQ4H4adNaQxi
	 ixblHiOu7zmGGYo7ElcwRXkG/6YFwYKNBIW1jF1vDKiR8lUQjXAptTwR9XB6A20lke
	 yuT6R5Dn7F9QgMdse2zW4LAhSz83Ymc+1xkxLLovEEzB3LfVgunERFx4avRJPVwnJd
	 mwVfe0gsdyr1RUoljX/ixWRR2g7fUJgHcgbv/0WC/wRiGSG2CSZ/d1VepdHLpEr42+
	 Rmhhhyd5rN4ISJJHKulOjATtjd8oC7+EM9Kq3POZ2hNjBXKrBlV9ugafYk/u5bAIdc
	 RpjonMEIEV6OQ==
Date: Wed, 25 Nov 2026 23:18:08 +0000
To: Thorsten Blum <blum@kernel.org>
From: Ryan Prinz <rc4d5a@protonmail.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller" <davem@davemloft.net>, linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, Ryan Prinz <rc4d5a@protonmail.com>
Subject: [PATCH] crypto: atmel-ecc - fix missing ECDH public key validation
Message-ID: <20261125231745.1857056-1-rc4d5a@protonmail.com>
Feedback-ID: 190731814:user:proton
X-Pm-Message-ID: d88ec8045df0efa8e9b1cfae8d246d3001ae9382
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

atmel_ecdh_compute_shared_secret() passes the peer's ECDH public point
into the ATECC508A/608A/608B secure element over I2C without checking
it first. The only check on req->src is on length
(req->src_len !=3D ATMEL_ECC_PUBKEY_SIZE); the coordinates themselves are
never validated before atmel_i2c_init_ecdh_cmd() hands them to the
device.

crypto/ecc.c's ecc_is_pubkey_valid_partial() is the generic software
check for this operation: it rejects a point that is zero, out of
range, or not on the curve. crypto/ecdh.c's compute_shared_secret()
calls it before computing the shared secret. This driver's hardware
path has no equivalent check.

Both the generic implementation and this driver register under the
same crypto_kpp name, "ecdh-nist-p256". This driver registers at
cra_priority 300 (ATMEL_ECC_PRIORITY) versus the generic
implementation's 100, so any caller requesting "ecdh-nist-p256" gets
this unvalidated path whenever an Atmel/Microchip ECC device is bound.

net/bluetooth/smp.c allocates "ecdh-nist-p256" for LE Secure
Connections pairing and performs no validation of the remote device's
public key itself; it relies on the crypto_kpp backend
(net/bluetooth/ecdh_helper.c's compute_ecdh_secret() converts the
wire-format coordinates to the big-endian layout this backend expects,
but does not check their validity). Unlike this driver's HPRE
counterpart, nothing else in that path currently blocks the call from
reaching the unvalidated code: on a device with an Atmel/Microchip
secure element bound as its ECDH backend, a BLE peer can send an
invalid public key during pairing and force the resulting DHKey to
one of a small number of predictable values in a single pairing
attempt.

I don't have access to this hardware, so I checked whether the device
itself might reject an invalid point instead. The ATECC608A-TFLXTLS
datasheet (Microchip DS40002138A) documents the ECDH command (opcode
0x43) as combining the stored private key with the input X and Y
coordinates directly; its description includes no on-curve or range
check. The datasheet also lists "Public Key Validation Support" as a
device feature, but that refers to the Verify command's Validate and
ValidateExternal modes (see application note AN8932, "ATECC508A
Public Key Validation"), which validate a public key already written
to a device slot against a certificate chain before trusting it for
future signature verification. That is a provisioning-time operation
on a persistently stored key, unrelated to the ephemeral peer public
key passed as live input data to the ECDH command.

Fixed by validating the peer-supplied point before it reaches the I2C
command, reusing ecc_is_pubkey_valid_partial() the same way the
already-submitted HPRE fix does.

Fixes: 11105693fa05 ("crypto: atmel-ecc - introduce Microchip / Atmel ECC d=
river")
Signed-off-by: Ryan Prinz <rc4d5a@protonmail.com>
---
No Atmel/Microchip ECC hardware was available to reproduce this.
Verified by applying this patch to an unmodified kernel tree and
building drivers/crypto/atmel-ecc.o directly (make drivers/crypto/
atmel-ecc.o), confirming it compiles cleanly with no new warnings or
errors. The point validation reuses ecc_is_pubkey_valid_partial()
unmodified. I traced net/bluetooth/ecdh_helper.c's
compute_ecdh_secret() to confirm the src buffer it submits is
big-endian X (32 bytes) || big-endian Y (32 bytes) -- the same layout
crypto/ecc.c's own generic compute_shared_secret() expects and the
same layout atmel_i2c_init_ecdh_cmd() already consumes directly -- so
this driver's new validation step reads the same bytes the same way.
I could not test against the actual secure element; the datasheet
citation above is the basis for believing the device does not perform
this check itself.

AI Disclosure: An AI assistant was used to assist with the
analysis and testing. I have verified the vulnerability, the fix, and
the test results myself and take responsibility for this contribution,
per Documentation/process/coding-assistants.rst.

 drivers/crypto/atmel-ecc.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/crypto/atmel-ecc.c b/drivers/crypto/atmel-ecc.c
--- a/drivers/crypto/atmel-ecc.c
+++ b/drivers/crypto/atmel-ecc.c
@@ -19,7 +19,9 @@
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <crypto/internal/kpp.h>
+#include <crypto/ecc_curve.h>
 #include <crypto/ecdh.h>
+#include <crypto/internal/ecc.h>
 #include <crypto/kpp.h>
 #include "atmel-i2c.h"

@@ -146,6 +148,34 @@ static int atmel_ecdh_generate_public_key(struct kpp_r=
equest *req)
 =09return 0;
 }

+static int atmel_ecdh_peer_pubkey_valid(struct scatterlist *src,
+=09=09=09=09=09unsigned int src_len)
+{
+=09const struct ecc_curve *curve =3D ecc_get_curve(ECC_CURVE_NIST_P256);
+=09u8 pubkey_buf[ATMEL_ECC_PUBKEY_SIZE];
+=09u64 x[ECC_CURVE_NIST_P256_DIGITS], y[ECC_CURVE_NIST_P256_DIGITS];
+=09struct ecc_point pk;
+=09size_t copied;
+
+=09if (!curve)
+=09=09return -EINVAL;
+
+=09if (src_len !=3D ATMEL_ECC_PUBKEY_SIZE)
+=09=09return -EINVAL;
+
+=09copied =3D sg_copy_to_buffer(src, sg_nents_for_len(src, src_len),
+=09=09=09=09   pubkey_buf, src_len);
+=09if (copied !=3D src_len)
+=09=09return -EINVAL;
+
+=09ecc_swap_digits(pubkey_buf, x, ECC_CURVE_NIST_P256_DIGITS);
+=09ecc_swap_digits(pubkey_buf + ATMEL_ECC_NIST_P256_N_SIZE, y,
+=09=09=09ECC_CURVE_NIST_P256_DIGITS);
+=09pk =3D ECC_POINT_INIT(x, y, ECC_CURVE_NIST_P256_DIGITS);
+
+=09return ecc_is_pubkey_valid_partial(curve, &pk);
+}
+
 static int atmel_ecdh_compute_shared_secret(struct kpp_request *req)
 {
 =09struct crypto_kpp *tfm =3D crypto_kpp_reqtfm(req);
@@ -166,6 +196,10 @@ static int atmel_ecdh_compute_shared_secret(struct kpp=
_request *req)
 =09if (req->src_len !=3D ATMEL_ECC_PUBKEY_SIZE)
 =09=09return -EINVAL;

+=09ret =3D atmel_ecdh_peer_pubkey_valid(req->src, req->src_len);
+=09if (ret)
+=09=09return ret;
+
 =09gfp =3D (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP) ? GFP_KERNEL :
 =09=09=09=09=09=09=09     GFP_ATOMIC;

--=20
2.51.2

