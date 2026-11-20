Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795180476;
	b=x0lpgPTng1LC1ifLLxhD6aSZtH5U0CHiE5UGEwozxTJ+EeOkHhHnjVlMJoQiRsjpGRje
	 lcL8vRQZ8nReFBmngFWd9YaDklGEZ5R1xLqm0I8cy3uqPFzdZ2dA/RUJqdSJVNyakRq+7
	 wWmGGB5vQ9gHfs2YBDkSg5DzPrczSwgxop43V2C11LpUdjQ+fVE9NDg6exNPFhUySEdhx
	 8dVZHkrHrPXeASlPG0Wmn9ZHQJRQCV7cbhgvqzk5tYliMalTmiTwnM+fvZ6saob9ZXWk3
	 B8Fl4TUM6dbceKhAj6KKmJX+Vc3Ynqtk3k4ryebuREFtHWhB2nKGfP1lzVw8vprAYKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795180476;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=hjx74QNy+MSSsM7cOslayY0WHKegLjGzo68YRxpsEY8=;
	b=NK9uUmb41WanULnqVbQif+iA0u3U20gz6E3QKRHm+w9g9/pJ5b0G9IWhFZiUUB90veJy
	 VWTjx3GLA/CrOYSUWYL9zFDbSWqT61vgkr2H+gewFUcRxx2wj6K+KXyuUmB7Orhwe+bNr
	 UctmZqFucwc7hVFgD/vDwPW4P0VI4QMYYgXQuenxtME8evE4nPqHBQ8KqGaTN+JYXO+2x
	 we8KqMbdQxfBrh822F3IFm4cZC29uxWBLjeGoKz76sb7b0GtdMxAuih8fPuTcgUgFSzxj
	 f3GmLv82fgUK5nmqbYigXn8wHu+90bEfnJVqdA+26cFlk3xqdLeYBAOOGsSYQKRsdRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vayavyalabs.com;
	spf=pass smtp.mailfrom=vayavyalabs.com;
	dkim=pass header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=nn7eVHwe;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D804606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:14:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D804606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vayavyalabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vayavyalabs.com header.i=@vayavyalabs.com header.a=rsa-sha256 header.s=google header.b=nn7eVHwe
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-382f4710a17so1406792eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:14:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vayavyalabs.com; s=google; t=1795180474; x=1795785274; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hjx74QNy+MSSsM7cOslayY0WHKegLjGzo68YRxpsEY8=;
        b=nn7eVHweC7R5E4OUvSfI6YzB3MDRANV4gkrXAH2warTDTrW36vOXlgRkzAjkIzHRdE
         bIWYuBXD4xlmccodtq2NlbLynIrCkrcOpnVOQbANmHXv+/7oiBUKpCjdUG8n5/te1nCq
         87EWjHg+Wtv3SOravmSeqGmde1f/i8iGuBU4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180474; x=1795785274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hjx74QNy+MSSsM7cOslayY0WHKegLjGzo68YRxpsEY8=;
        b=D+Y+KKP95/J63gzOG2AsQR+CTOfjYrW2enh1Um6iU3fxC4oxeDkGCXJOyvh3JqN+s4
         CRlMlJZ0FtRP2zLfeHm9R/Qfz72W07WV6euFHEKS+E17jvlxqjvk6eGjiJD7PvQhs6nl
         XB+hHMSNtm3J2ZLUkg6l8dfpiP9W5ZJT6ln6TcbXAgBzhSmLwwAnZ8jT/J9HJvcSVFiT
         06JDGDt1F337jyrBSbcMqeh2mXxxY/zlNiC0gYJ8sh/tsO+BFVVtxukRvpIjv0hCUoNJ
         uuhFixfBEKYPmyCS9HRZHcNk9FyfZeZqO6rD4kqLhgeJdV4e9YMaeaiVVb0m8mFb1cdY
         imMQ==
X-Forwarded-Encrypted: i=1; AL+hErH72hCue4W9cV51ioLQJ8kr0cywUB6fdUdM0QkkqKHptmAtXs8r/vxd9q8eb97ztXY2F2Dn4hP2R3QfFfg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pu8E2ZweQuswJKF2L23rZu53hQARtZFWfdXxEoL7SZeFVSRL4
	oao+9P6Wm4tg0iopxULOsM/mO+lfeA9EXnpWzk0UkPN5o9/sWx+IVLt/1NRD087QM6Q=
X-Gm-Gg: AYBFou1x3dLjqWj4G46p2er4R1Ig1vvinNqo4rMmZ7SUXo7RDXFFhiPBCuIbDbgVp+t
	pgKnHfvf9K4WLtUqVF2doffw+jlb2Kojqhx/8ezBkOo3Gjl2K+PvE/xX3TxEliuiyYswLVPv9BX
	hjqujLf4uYusvHxRnZJwBhdgK6DbeAOSRWT+yUVkooT8wVS8qfqVEH7XtBRx7HX+/huuOcW513r
	gkqFkkA0XcQnuXTMYPKGRJJzw+Fnxo2x6YkFkcpaACx7ktEnxMgvUNd0HArc54BgYR78SHLlJyq
	Sczo9eN6sxybsQTMTGj5nQp+wjw4BU3ych+6+XFqLKy/oEDcy89Rb+8R2dvoWzIneJGy4wMM3mV
	QZaX0+QFEGW0VbyZJe6HaJg50RlPa+aTB2paG2Z+7loNXVObkQsfNs2MB1mRq2JHkvVu9LAO9W6
	iu6rpkSb6aGpt7P3ctIcTRXi5+T5KqMuJCpjke+zP/aR+qKfOwTffvr/ASUx0j6YU8h2aRvm1P1
	aOLCRsfyO49modvPE+HAb53BuHQhjWceIDzKEK6d66p9aJwAnu/WS/by7QMBgDVZDSdbh9yZs9/
	Av9381P0ZNuonEocn4pMhaSH12ib746A5a7W6j7SYtCLqAL+SRdFOEUi2NsH22MY2z5kOnMZgvW
	BTIredMKsbUQeKFxAuYm0QrEpN9IEDZU8SXECohQ9OV0WvSqUyM7GotJ6V5d49Y0pm6eFDNLWAT
	DWFbaONb9UeWVyHQ==
X-Received: by 2002:a05:7300:e60c:b0:386:636f:c25e with SMTP id 5a478bee46e88-386636fc6f9mr1060801eec.12.1795180474513;
        Fri, 20 Nov 2026 05:14:34 -0800 (PST)
Received: from localhost.localdomain ([103.108.57.9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm8900527eec.22.2026.11.20.05.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:14:34 -0800 (PST)
From: Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
To: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	herbert@gondor.apana.org.au,
	robh@kernel.org
Cc: krzk@kernel.org,
	conor+dt@kernel.org,
	ruud.derwig@gf.com,
	rbannerm@synopsys.com,
	manjunath.hadli@vayavyalabs.com,
	adityak@vayavyalabs.com,
	navami.telsang@vayavyalabs.com,
	bhoomikak@vayavyalabs.com,
	nazim.khan@vayavyalabs.com,
	Pavitrakumar Managutte <pavitrakumarm@vayavyalabs.com>
Subject: [PATCH v31 0/4] crypto: spacc - Add SPAcc Crypto Driver
Date: Fri, 20 Nov 2026 18:44:00 +0530
Message-Id: <20261120131404.976959-1-pavitrakumarm@vayavyalabs.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the driver for SPAcc(Security Protocol Accelerator), which is a
crypto acceleration IP from Synopsys. The SPAcc supports multiple ciphers,
hashes and AEAD algorithms with various modes. The driver currently supports
below

hash:
- cmac(sm4)
- xcbc(sm4)
- hmac(md5)
- md5
- hmac(sha1)
- sha1
- sha224
- sha256
- sha384
- sha512
- hmac(sha224)
- hmac(sha256)
- hmac(sha384)
- hmac(sha512)
- sha3-224
- sha3-256
- sha3-384
- sha3-512

changelog:
  v1->v2 changes:
    - Added local_bh_disable() and local_bh_enable() for the below calls.
      a. for ciphers skcipher_request_complete()
      b. for aead aead_request_complete()
      c. for hash ahash_request_complete()
    - dt-bindings updates
      a. removed snps,vspacc-priority and made it into config option
      b. renamed snps,spacc-wdtimer to snps,spacc-internal-counter
      c. Added description to all properties
    - Updated corresponding dt-binding changes to code

  v2->v3 changes:
    - cra_init and cra_exit replaced with init_tfm and exit_tfm for hashes.
    - removed mutex_lock/unlock for spacc_skcipher_fallback call
    - dt-bindings updates
     a. updated SOC related information
     b. renamed compatible string as per SOC
   - Updated corresponding dt-binding changes to code

  v3->v4 changes:
   - removed snps,vspacc-id from the dt-bindings
   - removed mutex_lock from ciphers
   - replaced magic numbers with macros
   - removed sw_fb variable from struct mode_tab and associated code from the
     hashes
   - polling code is replaced by wait_event_interruptible

  v4->v5 changes:
   - Updated to register with the crypto-engine
   - Used semaphore to manage SPAcc device hardware context pool
   - This patchset supports Hashes only
   - Dropping the support for Ciphers and AEADs in this patchset
   - Added Reviewed-by tag on the Device tree patch since it was reviewed on
     v4 patch by Krzysztof Kozlowski and Rob Herring (Arm)

  v5->v6 changes:
   - Removed CRYPTO_DEV_SPACC_CIPHER and CRYPTO_DEV_SPACC_AEAD Kconfig options,
     since the cipher and aead support is not part of this patchset
   - Dropped spacc_skcipher.o and spacc_aead.o from Makefile to fix build errors
     reported by kernel test robot
   - Added Reported-by and Closes tags as suggested

  v6->v7 changes:
   - Fixed build error reported by Kernel test robot
   - Added Reported-by and Closes tags as suggested

  v7->v8 changes:
   - Fixed misleading comment: Clarified that only HMAC key pre-processing
     is done in software, while the actual HMAC operation is performed by
     hardware
   - Simplified do_shash() function signature by removing unused parameters
   - Updated all do_shash() call sites to use new simplified signature
   - Fixed commit message formatting by adding "crypto: spacc - <subject>" to
     all patches
   - used __free() for scope based resource management

  v8->v9 changes:
   - Updated the software fallback implementation to use HASH_FBREQ_ON_STACK
   - Corrected dynamic allocation of statesize and reqsize in init_tfm
   - Fixed synchronization issues in the digest request

  v9->v10 changes:
   - Fixed unused variable warning

  v10->v11 changes:
   - Removed the redundant crypto_alloc_ahash in the init_tfm function
   - Removed the redundant crypto_free_ahash in exit_tfm function
   - Removed the redundant crypto_ahash_setkey call in setkey function

  v11->v12 changes:
   - Removed do_shash() and switched to lib/crypto API in spacc_hash_setkey
   - Dropped support for SM3 algorithm
   - Improved multi-device safety by encapsulating handling within priv
   - Added memzero_explicit() in sensitive paths
   - Minor code cleanups and style fixes
   - Algorithm registration cleanups

  v12->v13 changes:
   - Removed all the sleep function from setkey function
   - Added shash implemntation for aes algorthims

  v13->v14 changes:
   -Added fixes based on the reports by Sashiko
   -Removed the spacc_is_mode_keysize_supported call from do_one_request

  v14->v15 changes:
   -Added fixes based on the reports by Sashiko on 19/jun/2026
   -Fixed styling in the Kconfig

  v15->v16 changes:
   -Added fixes based on the reports by Sashiko

  v16->v17 changes:
   -Added fixes based on the reports by Sashiko

  v17->v18 changes:
   -Added fixes based on the reports by Sashiko

  v18->v19 changes:
   -Added fixes based on the reports by Sashiko

  v19->v20 changes:
   -Added fixes based on the reports by Sashiko

  v20->v21 changes:
   -Added fixes based on the reports by Sashiko

  v21->v22 changes:
   -Added fixes based on the reports by Sashiko

  v22->v23 changes:
   -Added fixes based on the reports by Sashiko

  v23->v24 changes:
   -Added fixes based on the reports by Sashiko

  v24->v25 changes:
   -Added fixes based on the reports by Sashiko

  v25->v26 changes:
   -Added fixes based on the reports by Sashiko
   -Removed the additional fallback
   -Added the CRYPTO_AHASH_ALG_BLOCK_ONLY flag to the cra_flags
   -Minor code cleanups and style fixes

  v26->v27 changes:
   -Added fixes based on the reports by Sashiko

  v27->v28 changes:
   -Added fixes based on the reports by Sashiko

  v28->v29 changes:
   - Resent with patch 2/4 regenerated; v28 2/4 had a corrupt hunk
     header and failed to apply. No functional changes from v28.

  v29->v30 changes:
    -Added fixes based on the reports by Sashiko

  v30->v31 changes:
    -Added fixe based on the reports by Sashiko

Pavitrakumar Managutte (4):
  dt-bindings: crypto: Document support for SPAcc
  crypto: spacc - Add SPAcc ahash support
  crypto: spacc - add spacc autodetect support
  crypto: spacc - Add SPAcc Kconfig and Makefile

 .../bindings/crypto/snps,dwc-spacc.yaml       |   50 +
 drivers/crypto/Kconfig                        |    1 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/dwc-spacc/Kconfig              |   64 +
 drivers/crypto/dwc-spacc/Makefile             |    7 +
 drivers/crypto/dwc-spacc/spacc_ahash.c        |  806 ++++++
 drivers/crypto/dwc-spacc/spacc_core.c         | 2407 +++++++++++++++++
 drivers/crypto/dwc-spacc/spacc_core.h         |  861 ++++++
 drivers/crypto/dwc-spacc/spacc_device.c       |  340 +++
 drivers/crypto/dwc-spacc/spacc_device.h       |  178 ++
 drivers/crypto/dwc-spacc/spacc_hal.c          |  349 +++
 drivers/crypto/dwc-spacc/spacc_hal.h          |  113 +
 drivers/crypto/dwc-spacc/spacc_interrupt.c    |  365 +++
 drivers/crypto/dwc-spacc/spacc_manager.c      |  641 +++++
 14 files changed, 6183 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/snps,dwc-spacc.yaml
 create mode 100644 drivers/crypto/dwc-spacc/Kconfig
 create mode 100644 drivers/crypto/dwc-spacc/Makefile
 create mode 100644 drivers/crypto/dwc-spacc/spacc_ahash.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_core.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_core.h
 create mode 100644 drivers/crypto/dwc-spacc/spacc_device.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_device.h
 create mode 100644 drivers/crypto/dwc-spacc/spacc_hal.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_hal.h
 create mode 100644 drivers/crypto/dwc-spacc/spacc_interrupt.c
 create mode 100644 drivers/crypto/dwc-spacc/spacc_manager.c


base-commit: 04cd6899aaaeeab82afb97e58eb8619fde35b47d
--
2.25.1

