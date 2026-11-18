Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010980;
	b=4D5BgCggbpC/WZQx7ZxvyN5EOEZNekg1wOh2d4R3KyREi0Kn3/adWxNNKUux7ikHeTcW
	 nvGPCPP5Sy/pJi40s6cXF/HhYU3A5cJlFPcdBfpOtFTPVqsw0kpffpQyi+qH2ucIHb4tb
	 PXAPtO4wdUyBjFL4XTDJPTXa3XBTA/2vveewcpShg+poTAj+/jtumawVKBsUSViijoYEP
	 OW2FA4RYhAJTjS2Bfj+kuGU9aI3+3UreZXHvCz4ftxxiSQzJqjZNZ4LehVXT2FlJ4IjH+
	 PM863O/n3Aj2/GY1PPveFYzWcwyJpNFhyH/3j4Q4bBfOBR70XcmTEQevQsN8xE3L7+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=Rq0PfD2xRZfQ/WIKTtIY+F8v5ivaNOXKP0+lK8OfxMY=;
	b=pxVgrc4Rf6lzS0Dls8Hx3pu8qyiRKMTXzRZmSDR5gQDutNn357b3IT9oGxmr/atoNooF
	 Psx6g0xkbrhnCw7fbvD+zhNR9LapQACm/MbiMtwCvlTCLai4B+7hYCNUc+kZCm7vsyRNp
	 SpvVd62j0wq0O5mMFKJgnJYQq8jIt4fXPSTPqE1NZx6vLFTljRhNUnNAGBWtYGWotmPhG
	 O9n7E3VYllhu1K2qpvr3U5zyGaZJwApAh5yHqY+ffFNejOYpnM73JeuZIpidldFHTakHT
	 5qVnQFRkFZ89/WoPtK4qMxSyvu+JJnb6O/V3xQu4PD/tjJsrX6OfmYzMVgSe24IWJiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYEO+69d;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0097D606A335
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0097D606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uYEO+69d
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-86156cf8a7eso1473349a34.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 06:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010978; x=1795615778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rq0PfD2xRZfQ/WIKTtIY+F8v5ivaNOXKP0+lK8OfxMY=;
        b=uYEO+69dr88VKPWhY3B78Jos5ffynsg+pup6Ok+MMDYglEg2rPD+rfjAueU7rdyEGC
         3DsvPoIQN+cQs065e68ihpL/g1ucuyd1ja+8gOgM5moj14ScRyzU7XfHZNZHb4C2yf7j
         h/K5JkfPJmItIBqs92jyjSZMFFtBc+UOQHi5MstT8JFySJ+zpJ0dUY9rvQix2fEM+b4/
         tA3Ju2Il4eGFSmnj3YR8I4MU66AfcvpNXjAeRdoldAd1skjFX9JqmqGjYZ6zh3Gz4gbY
         Dx7kb+/pCrxd8v9aUUppOTtmYe2pRoJnWI3gyOZpJH+kR2QFP95uWLeyEPmceHV+u0Ju
         4UVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010978; x=1795615778;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Rq0PfD2xRZfQ/WIKTtIY+F8v5ivaNOXKP0+lK8OfxMY=;
        b=gORq2mfI0U2z3fcsVZuLzlJcPPaw7zIP3hfrlnrWqNINswCvBS1oFepMyO3jnXGiSH
         ZrU0JkK2eiIOXilR1TdhxjpltNJmPvwcHQTnuve6QwaXEsWtr8TlYsgqHeh4C/nfFTuI
         mFIF11dQNl3z7kEAitUPfFqEvEtXGEFr74CpPjUPSEua9tMuwELPLposNwbLGg6nuIGz
         25vYCV7LWRC0cpllQC/kgukIZNimHs4xuE1w+Y7aAFsiGNO9pcYmH4gu+3x7Bxr4WIpx
         cH8I9gYxECYA8d9gf1MMKwAZbSZykqko3PmUkTqvKtpR6dC272GREq3zCQ01O1fXSFC4
         pnsQ==
X-Forwarded-Encrypted: i=1; AL+hErHqWYZYrbAxoiaLyKbZ3va7GrB3IsvbcU0EzJNHVXHLeYdFw45lVEwbMEOJ2cuu2qrxidlfp93At/732D0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ClJF9+VvNH8owo03ECk/VC3NrWIMpvmdGpU3D3ltayOSxpDQJ
	h8KkLsy9ZY/3jfspk3zM+wUHPAgO1DvJKQyAmqxfaPKPGK0qNlxE2ug8
X-Gm-Gg: AYBFou0E/hMIAo389Cz/kSuxBDY0B0CjTGucBRTd07lagIZX35ok83GD3RGYJ9PgdAW
	WWGQ304xFBD5baS2lhER8gBpQFQ6mI3ISuIgi2MfrT38FtVYfW0FN2+MF1wLdqthpjLO7SRuddh
	FXM03UMxoCxBHPTMawyXWgqqa+kv1v6pvmKi69eia6SVN1hmADY6bv2hasJV1VA1JSF2BVE/+2n
	Nj4qEMz71fVZ/rjvcrhXeYfFvv3AKW/TOQMG4UUz0BQYzM+QGLvA1YtVW2MvrfMZr/nphZwSyOZ
	adFGkAbmWObx0xU1trWO2FsrORqzN3CPzt1seJQJImRcnpwZ/CIbxv/2olQtZoTaSchfs4ImZna
	42pnYgI09gtuqAQ4jbZbMiBLNBXiaD1dg8GFHLo2a6SxFcY9yira7AhVoJgZsLW/s9lLxGVNADM
	1MbyA21bK8u2CwphiGfDu4LRoZ/26fPiBQbjI7sM6KWjXXLJhH3cmcgjdnusXBayBhNlyxtfEdD
	7bEK3HgmfSoXUOhMh7R4jn1NyJbUsVk/TpQ97Q1+Q68iKi/L2YRr6C1aySOW0jODkHDT5OeKGhA
	s/P84D2uPdefWL3XzLsPvtWQqFwX6gSLxa+9/NPj1Nirjy8csQ==
X-Received: by 2002:a05:6820:f029:b0:71a:f794:49c9 with SMTP id 006d021491bc7-71b185b766fmr1548510eaf.32.1795010977853;
        Wed, 18 Nov 2026 06:09:37 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:74::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b195c0bafsm1784113eaf.14.2026.11.18.06.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:09:37 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Subject: [PATCH net-next v5 0/6] psp: support rekeying psp protected tcp
 connections
Date: Wed, 18 Nov 2026 06:08:02 -0800
Message-Id: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEOx/WoC/2XMywrCMBAF0F+RrI3k3daV/yEuxmRiA/ZBU0ql9
 N+NUVR0M3C5c+5CIg4BI9lvFjLgFGLo2hT0dkNsDe0FaXApE8GEYenQPvZU2hKFN9pqq0j67Af
 0Yc4rR9LiSFucR3JKTR3i2A23PD/x3L+WVF6aOGVUeyYVCudBmsOlgXDd2a7JfhJvwxmrnkY8j
 K4MnDXzpih+jfwYzszTyGSgdE6WXkMh/oz6MvxlVDIcdFU5LwA9fJt1Xe/M1mFCPAEAAA==
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Willem de Bruijn <willemb@google.com>
X-Mailer: b4 0.13.0

A note on v3 and later:
To keep this series short, I have split off some of the content that
appeared in v2, and also have planned future work that will make this
feature more robust, but not necessary to start. Here is the current
queue of follow up series:
 1. core tracked tx-key-count stat and SADB drain test case (from v2). I
    see this as able to stand alone as a series, and I also would like
    to report key deletion errors, but will have to touch mlx5 for that.
 2. core to end grace period if BQL is stalled. I think this deserves
    its own series for human discussion.
 3. Rate limiting rekey uAPIs. This has been suggusted by the bot, but
    whether or not it is needed depends on a bit on the deployment
    model.

Original cover letter:

The PSP architecture spec states the need for rekeying connections in
the event of a device key rotation. After a device key rotation has
occurred, a new rx derived key needs to be generated and sent out to the
other end of the connection sometime before the next device key rotation
occurs.

Because PSP connections involve two different keys at each endpoint,
one for decrypting ingress traffic, and one for encrypting egress
traffic, there are two types of rekeying events that need to be
supported. From the perspective of one endpoint of the connection:

1. rx rekey: we need to allocate a new spi + decryption key pair to
   provide to our peer.

2. tx rekey: our peer has provided us with a new spi + encryption key
   pair which we should use for encrypting traffic immediately.

In the case of rx rekeying, there is a period where it makes sense to
accept packets authenticated from either the previous or current spi. To
deal with that, we allow a psp_assoc to remember the last spi that was
valid on a socket due to a rekey. If authentication state does not match
the most recent assoc, the stored state from the previous assoc will be
tried.

In the case of tx rekeying, as soon as we install the new tx key, we
have no use for the previous one, and it can be disposed of immediately.
The only catch is in the case where hw uses a key handle in tx
descriptor state, as opposed to inlining the key directly. In this
case, psp core needs to be sure that any of these unaccounted for
references to key state are gone by the time it tries to sync a deleted
key to hw.

To deal with this race condition, we introduce a different path to key
deletion for psp_assocs removed from the socket during a tx rekey. psp
core will use bql byte counters filled out by the driver to determine a
conservative grace period where key handles can be disposed of.

Lastly, some test cases for rekeying are included that go through key
rotations and rekeying.

There are some packetdrill tests that are queued for upstreaming [1].

Future work can include a time based rate limit on the rx-assoc/tx-assoc
uAPIs to prevent an untrusted user from creating lots of wasted PSP
assocs and consuming SPIs, SADB space, etc. For now, users should use
network namespaces, or otherwise not present PSP devices to users that
could abuse this.

[1]: https://github.com/danieldzahka/packetdrill/commits/psp-rekey/

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
Changes in v5:
- psp: document lock ordering with the netdev instance lock
  - new patch
- psp: defer tx key deletions for SADB drivers
  - take a psd reference across mutex_unlock() in psp_assoc_free() after
    handing the assoc to the deferred queue
  - move the psp_dev_unregister() locking rule to a separate patch
- selftests: drv-net: psp: add rekey tests
  - drop the fail-fast change to _recv_careful(); it is a pre-existing
    helper
- Link to v4: https://lore.kernel.org/r/20261116-psp-v4-0-1a599df2aefa@gmail.com

Changes in v4:
- selftests: drv-net: psp: factor out psp connection setup
  - drop closing the data socket on conn_setup_psp() failure;
    preexisting and not needed by the series
- selftests: drv-net: psp: add rekey tests
  - reuse _recv_careful() and _req_echo() now in net-next instead of
    redefining them
- Link to v3: https://lore.kernel.org/r/20261106-psp-v3-0-a8dd38f5a727@gmail.com

Changes in v3:
- psp: support rx rekey operation
  - move the replaced assoc to psd->stale_assocs, so a rotation
    racing with its free doesn't count it in stale-events
  - drop the requirement that the new rx spi has the opposite phase
    bit from the previous one
  - keep prev_generation valid across a rotation when the prev SPI is
    from the same generation
  - document rx rekey in the rx-assoc op doc in psp.yaml
- psp: support tx rekey operation
  - move the replaced assoc to psd->stale_assocs, so a rotation
    racing with its free doesn't count the socket twice in stale-events
  - document that the previous rx SPI also stops being accepted once
    its device key is rotated out
  - drop the claim that the peer accepts both the old and new SPI
    after a tx rekey
  - document tx rekey in the tx-assoc op doc in psp.yaml
- psp: defer tx key deletions for SADB drivers
  - document that Tx descriptors must be completed or discarded
    before psp_dev_unregister()
- selftests: drv-net: psp: factor out psp connection setup
  - take key lengths from the kernel's rx-assoc reply instead of a
    per-version table
  - close the data socket in psp_responder if conn_setup_psp() fails
- selftests: drv-net: psp: add rekey tests
  - drop test for rx rekey rejected without a device key rotation
  - fail fast in _recv_careful() if the peer closes the connection
  - in the basic rekey tests, run traffic across a rotation before the
    rekey, and rotate again after it to verify the new key is in use
  - drop unneeded key rotation from rekey_rx_version_mismatch()
  - carry the key length in the responder's assoc message instead of
    deriving it from the version
- psp: add core tracked stat for outstanding tx keys
  - moved to a follow-up series
- selftests: drv-net: psp: add a tx rekey drain test for SADB drivers
  - moved to a follow-up series
- Link to v2: https://lore.kernel.org/r/20261009-psp-v2-0-5596ab50f677@gmail.com

Changes in v2:
- psp: support rx rekey operation
  - copy old rx state by value instead of pointer to prev
  - place non-datapath fields at end of struct psp_assoc
  - disallow rx rekey when socket is not in full psp state, or
    dev/version doesn't match
  - require the new rx spi to have the opposite phase bit from the
    previous one
- psp: support tx rekey operation
  - place new assoc on pas->assocs list instead of psd->active_assocs
  - disallow tx rekey when socket is not in full psp state
  - document rekeying in psp.rst
  - reject tx rekey on SADB devices until deferred tx key deletion
    lands
- psp: defer tx key deletions for SADB drivers
  - replaces "psp: add driver api for deferred tx key deletion"
  - use bql byte counters instead of driver callback for grace periods
  - only defer tx key deletion when socket outlives psp_assoc
  - document driver requirements in psp.rst
  - allow tx rekey on SADB devices
- psp: add core tracked stat for outstanding tx keys
  - replaces "psp: add core tracked stats for deferred key deletion"
  - drop grace-periods stat
  - rename tx-key-cnt to tx-key-count, only report it for SADB drivers
  - warn about outstanding tx keys in psp_dev_unregister()
- selftests: drv-net: psp: factor out psp connection setup
  - split psp_responder conn_setup_psp() into rx_assoc() and tx_assoc()
  - drop Reviewed-by from Willem due to psp_responder changes
- selftests: drv-net: psp: add rekey tests
  - add tests for rekeys rejected due to psp state and version
    mismatch
  - add test for rx rekey rejected without a device key rotation
  - add rx-assoc, tx-assoc, and key-rotate rpcs to psp_responder
- selftests: drv-net: psp: add a tx rekey drain test for SADB drivers
  - new patch
- mlx5: psp: implement deferred tx key deletion
  - dropped, bql based grace periods need no driver callback
- Link to v1: https://lore.kernel.org/r/20260204-psp-v1-0-5f034e2dfa36@gmail.com

To: Daniel Zahka <daniel.zahka@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: David S. Miller <davem@davemloft.net>
To: Eric Dumazet <edumazet@kernel.org>
To: Paolo Abeni <pabeni@redhat.com>
To: Simon Horman <horms@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Donald Hunter <donald.hunter@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>
To: Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org

---
Daniel Zahka (6):
      psp: support rx rekey operation
      psp: support tx rekey operation
      psp: document lock ordering with the netdev instance lock
      psp: defer tx key deletions for SADB drivers
      selftests: drv-net: psp: factor out psp connection setup
      selftests: drv-net: psp: add rekey tests

 Documentation/netlink/specs/psp.yaml               |   8 +-
 Documentation/networking/psp.rst                   |  68 +++++-
 include/net/psp/functions.h                        |  10 +-
 include/net/psp/types.h                            |  35 ++-
 net/psp/Kconfig                                    |   1 +
 net/psp/Makefile                                   |   2 +-
 net/psp/psp.h                                      |   8 +-
 net/psp/psp_deferred_del.c                         | 231 +++++++++++++++++++
 net/psp/psp_main.c                                 |  31 ++-
 net/psp/psp_sock.c                                 | 123 ++++++++++-
 tools/testing/selftests/drivers/net/psp.py         | 246 ++++++++++++++++++++-
 .../testing/selftests/drivers/net/psp_responder.c  | 192 +++++++++++++---
 12 files changed, 900 insertions(+), 55 deletions(-)
---
base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
change-id: 20260202-psp-3c8e2f65c5c4

Best regards,
-- 
Daniel Zahka <daniel.zahka@gmail.com>

