Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684810;
	b=oDPhPRE1VXSLfe5Ol4LX2+Iv/v93TY7uiLqmf4MjldkdPL0/wHNObcb3Wrt+hiMTcDLH
	 tD0n8h9R8RjyX2pWIGb3WfFCo8SZ/vod0P/aWQoCX03r4Ie0ZNlZ2Y4P6YLrd5E+l10at
	 pnAvsKIKNcENEPuNInCBlqRj9hbijGnh/I7QfXtS018amIW5C1trrkWGr4BlWTcbRZo5L
	 ZxonReBwF8gjALiEKq3E4h5hRIQpf3vql5LcOI4MEcnIqwaO6pVbciA17v7KwmrLMcgP4
	 l24pNr9dXDeODd7PT6RKB6IdGz8UEO5Sk0bxrr5xqzfM+dUoVYG5d+/C4gtG5mBrxmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684810;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YSWGbZPwr9sJMOQLpiVypNb+LSdgPlTuQnvpKc7sF1o=;
	b=lnxy3xmN5Epzwm+SMX9PQ0gDDGLvTcf4SjuniJ5+xbTwP7w22Be/0Gh0t+gIxBWFp1D5
	 NO9RC3+BwyWeJVqfH85bA7K59yMG+f4wk8B8RX6fwMBPxuSZmsb61NjQZ0YqKlt8dRjn4
	 VdfNDIfW/xy3kF8dEAbKUwztvM3UyUyzzAYCgNpEvTIfSV8A+ohTHngZfy/5QX01ZsYEN
	 g5AGpnu6a2cBIPG8LGGqt7wjIb9eTjc5gAW3c4v+2HRuwkSVX/bfRcbVc+DcrK3kczxLC
	 LHjmMaBYhkPUA9wy26dyneb4FL1qbjy4Abyfqltmq290TjyjeiAsYEIVRGrPaE3W6Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvW+SgGa;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEFF0606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:20:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEFF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nvW+SgGa
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1b244fb7fffso7180642c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684809; x=1796289609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YSWGbZPwr9sJMOQLpiVypNb+LSdgPlTuQnvpKc7sF1o=;
        b=nvW+SgGa/kN9lh0cXnSBONwhpUuHro3RapFfFTgEK5nkueJVMH0McdaAgipK6MeIY9
         DieSNzouwUOmaXXMl5e30MzunC20JhacZfOhv5RAQSKiBqwUXNRLXHeV828QdnpFXn98
         2wobAqFydRzYo35fJ6J8KWWNS0CeT22PXCn3AeU017OOuKrmgPKEiGycFW4HXvXtfOX1
         1wIwSrTOkCuhDYaORtONgnBF2udiwSTBUWN42lVIfOzB6TuNdtwLMPffwVy7mpPh0aPy
         mUkJVWmZ/bl3/4Hb+k1FtM/zlpbJEUi18XH5KsuuBumdX9eG7h57MHRKeqSWdNlM3v32
         GINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684809; x=1796289609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSWGbZPwr9sJMOQLpiVypNb+LSdgPlTuQnvpKc7sF1o=;
        b=utcnycxyIZIDLFQANiFeT1ETpbybjfkP1z0AMpUG/aVK8yexjNgRTk6+3ACI11M5t4
         SMWVM66/Bwvl+vjK1ZRuEiV5OTiXj2TU2xdjDqd5b5y+24tLDB8/yuaa++iIwAJtb/81
         IV6oFuW98fXJWoNZptXNpzvdR9JFYhrqpzvrMklvEt7cWoDP60yxLSMToUWMh9cPpCV2
         89JHI8MsjOrWod2Nm50+tPrcAUKJf0jwlY48o7bL1pFGfPMmXHo/sVhZ/RbcIwfPhrT0
         vwiJzjVdGyE9C++66/eAeKNILgWONSNjXQzZ3pqXlF2Ur/y00LS0B7w7MlvJATJvnzLH
         3U8A==
X-Forwarded-Encrypted: i=1; AL+hErHCKpI6Cd9Su3TxI7IECXtE6f9fqU/1cPP/SYuxyB1FsMUKf/Y9v58rV2y0+KLLCDSKK/iSRneJhEUne+M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LITGjUw3NnVs/FPkMm1PkoxfcJBAlbPVwDu9M+ILk2MjX9ONY
	Oa533q/hcFU6gCH+0c30DTdfBZeGueWN0U5iZBsqPTFNKeW2AdDLjyt1
X-Gm-Gg: AZFdTZd8FXpGt7KpaIVM2nrTlkV73SxJJXgna/kUEB0biOLI9KHeKpXrJaJ6UYry0ps
	c5T6eVCtBS2eZ2vplTWiPfykKFIZeXCG89fGibVKoUAAXN3fF3wbJhfVRe8mvq6PtK9AN0MYxo9
	+CzWT8CigICdngdAFjMB0MrAUsdFTWBv4aSJgL5zAbi2XD6lK6QDo7jgpc4AsCJCxOaaiOWq401
	UByCU/MQGmYY3wQIC/XpAOEqWWOxuz3SOMyjNjWLCLp/Ace9U6ehYmVSUvG/Q4nrBvlwUNPff17
	HMtREPIQr6dKXwK1xuiRtRfJshjcLbikrcB8OdZhicy6u+OpNQnsj4igxtEmYgQTIGoQlq482Xv
	0iZ5zNRgDaQOz1PTaZxiOpkmDrx4k10KAa2Bskwoh0fJb2cFNfROPO7YmxMkaBCMXpyhZaaHqzU
	J4nnKm105Wa1n2J9CEsCjDE1cQCoHxi7z6HingDvjM/1D4oyHm9fJ4ZH4mBX8j0r4YFgt76M+up
	MSSOizGAmn/daeKPNhhFThqBlR7J4wYtF9OJIIWkQIaO4XIYLo7a4FSZlFMmqdwj099P8dGDgIx
	PJjwTXRTAIc4gPk6EpkLe6YJTqHhgWmut9gynWPyQg==
X-Received: by 2002:a05:7022:3a8b:b0:15a:4155:3d9d with SMTP id a92af1059eb24-1b5568d6db3mr25122033c88.31.1795684808698;
        Thu, 26 Nov 2026 01:20:08 -0800 (PST)
Received: from 10-86-27-207.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm48711524c88.10.2026.11.26.01.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:20:08 -0800 (PST)
From: Gokul K <gokul02k@gmail.com>
To: Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	John Allen <john.allen@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	David Rientjes <rientjes@google.com>,
	Peter Gonda <pgonda@google.com>,
	Atish Patra <atishp@meta.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crypto: ccp - Do not hand a short INIT_EX file to the firmware
Date: Thu, 26 Nov 2026 14:50:01 +0530
Message-ID: <20261126092001.2099312-1-gokul02k@gmail.com>
X-Mailer: git-send-email 2.54.0
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

sev_read_init_ex_file() reads the INIT_EX non-volatile state from
init_ex_path into sev_init_ex_buffer. When the read returns anything other
than NV_LENGTH it logs the fact and then returns 0, so the caller carries
on and __sev_init_ex_locked() passes the buffer to the PSP as the
platform's saved state.

For a truncated file that buffer holds a prefix of the old contents
followed by the zeroes the page was allocated with, which is not a state
the firmware ever wrote. A negative return from kernel_read() is treated
the same way, and then the buffer holds nothing but zeroes while the code
still reports success.

This is not what the interface promises. Documentation/virt/kvm/x86/
amd-memory-encryption.rst says of init_ex_path:

  If the file specified by ``init_ex_path`` does not exist or is invalid,
  the OS will create or override the file with PSP non-volatile storage.

A file that cannot be read in full is invalid, so discard what was read
and let INIT_EX run from a zeroed buffer, exactly as it does when the file
does not exist yet. The firmware then repopulates the buffer and
sev_write_init_ex_file_if_required() writes it back, which is the
"override" half of the documented behavior.

Doing this for a negative kernel_read() return means a transient read
error costs the platform its persisted state rather than failing the
init. That is the deliberate trade: the documented contract allows the
file to be overridden, and feeding the firmware a buffer it did not write
is worse than starting over.

This was found while looking at the INIT_EX failure reported by Sean
Christopherson, where an interrupted writeback leaves the platform
unusable. It addresses only the case of a file that is short or unreadable
on the next init. An interrupted write leaves a full-length file holding a
mix of old and new bytes, which a length check cannot detect, so the
reported failure is not fully fixed by this patch.

Fixes: 3d725965f836 ("crypto: ccp - Add SEV_INIT_EX support")
Reported-by: Sean Christopherson <seanjc@google.com>
Closes: https://lore.kernel.org/all/abSWm4wyY91I4zf8@google.com/
Signed-off-by: Gokul K <gokul02k@gmail.com>
---
Compile-tested only.  I have AMD hardware but not a working SEV INIT_EX
setup, so the path this touches has not been exercised on a machine.  Built
at W=1 with CONFIG_CRYPTO_DEV_SP_PSP=y, and confirmed sev-dev.o is not built
with it =n.

What this does not cover, and I would rather say so up front than have it
found in review: the failure in the report starts with an interrupted
kernel_write() in sev_write_init_ex_file().  That file is opened without
O_TRUNC, so a partial overwrite leaves a full-length file whose head is new
and whose tail is stale.  Such a file passes the length check this patch
adds and still reaches the firmware.  Making the write side leave either
nothing or something detectably invalid behind is a separate change, and I
did not want to bundle an untested design decision with this one.

I also have no explanation yet for the widespread memory corruption in the
report.  A zeroed or stale NV buffer should not produce corrupted page
tables, so I assume something else is going on there and this patch does
not claim to address it.

If anyone with an INIT_EX setup is willing to run the reproducer from the
report against this, I would appreciate it, and I am happy to follow up on
the write side.

 drivers/crypto/ccp/sev-dev.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/crypto/ccp/sev-dev.c b/drivers/crypto/ccp/sev-dev.c
index f833cb7e4da3..6d7ea028d24f 100644
--- a/drivers/crypto/ccp/sev-dev.c
+++ b/drivers/crypto/ccp/sev-dev.c
@@ -302,14 +302,23 @@ static int sev_read_init_ex_file(void)
 	}
 
 	nread = kernel_read(fp, sev_init_ex_buffer, NV_LENGTH, NULL);
+	filp_close(fp, NULL);
+
 	if (nread != NV_LENGTH) {
 		dev_info(sev->dev,
 			"SEV: could not read %u bytes to non volatile memory area, ret %ld\n",
 			NV_LENGTH, nread);
+		/*
+		 * Whatever was read is not what the firmware last wrote, so
+		 * none of it can be handed back to the firmware. Discard it
+		 * and let INIT_EX start from a zeroed buffer, which is what
+		 * happens when the file does not exist yet.
+		 */
+		memset(sev_init_ex_buffer, 0, NV_LENGTH);
+		return 0;
 	}
 
 	dev_dbg(sev->dev, "SEV: read %ld bytes from NV file\n", nread);
-	filp_close(fp, NULL);
 
 	return 0;
 }
-- 
2.54.0


