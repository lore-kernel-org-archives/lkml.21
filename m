Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285382;
	b=3wcc0mo1kzmR34uhDmKFb/EBV4Pz6F864Dd+MZX1B56eff/FoEVcjOGwfdK+s1vPIm+g
	 203QAeqBhbKoD0oC2qd+ewlgqIsb1oxpRBMfVdQlRlyma2ZMMQbn2KDUQ2/NpHLYVNElC
	 mAiQqRWf9HMew1eewmJTMSrtGcLU8xLFsoRZ/WMSMcTuAEoAFaMi7aQ6TwWB2X/sUsIqk
	 RttXcHRr0GBzs7r9e7puy/8qmX6FzsmhRSzsOZAelq6KHS0sKraBq8xM8mVBFoktAZjQe
	 4xn1L26CWmaT3nJflXeTLJVjD3gZ3f7LHv0ee0dVPcpf+uzhQ/SWJubfhZNkILu+Auw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285382;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=o9NEFNsCc2NcvWKzT31mhYcyJnIDEUd26l3VnghLY1E=;
	b=0AaAu1ib7Q1imDmdNacaWVJiqPkmV47NAZ4xXhRyaK0KKNCk/CzGOO8kf+5x1t+w/hfi
	 kNNMMpWbu1cwhEq42XIr0MI01mG4eBxaHHdaYO0BGdnaXMyaTH1Hg3qkbQUjnMrEfhiYs
	 Eo/OCYQIbD10XiX/zHZjmQWdQR13bcuLeyxqIeexgQn5majvQMkLyrLgJQ5akaeOIsGBL
	 KlcmhGBjLYgJu/EAP6ooqi02Kc4Id/wx/oaflI+Z7qvwGRDpxd8eKg4IhFIhz1VSfn862
	 NXMcuk3JdHrmLdQfntzlrrjz0V7fu2YwcSeXNMNV7PLxcRFEmfDvWlO+PqDJTWWODow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+uj6aRa;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AFE606A330
	for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 18:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68AFE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d+uj6aRa
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490b7266f7bso77528f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Nov 2026 10:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285381; x=1795890181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=o9NEFNsCc2NcvWKzT31mhYcyJnIDEUd26l3VnghLY1E=;
        b=d+uj6aRa0JypX9ox6qZscWxSUxC7fqg0E+T3t+0FHue6GwYr0GnyLPk0milV6Qx2sG
         gZ0Yk8Q/1UC38PopKspEizuRHpxviyq0By6uWAwW008Tap/ZGuTO/Q4J55OXrLmBjNpZ
         37Ba8lvXdMc0XdwkvP0A2GIIII5oZlzqGOigeYK6wRmJbqVTd0MvYqNS5MdV361f9vQ5
         kc1Kyj31ddNQ4eUf3KbDLmmzUUkIt3dw1D2kCS+sSK05KrXgz3CvI/1dA73mt2KmcRZN
         J9mW5kvXkzgQ4i02o9lspKbFcjuns+2Cc/CI0EFUTn6e30E3RlWqrhdczIjKvql5KEmW
         mTsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285381; x=1795890181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o9NEFNsCc2NcvWKzT31mhYcyJnIDEUd26l3VnghLY1E=;
        b=DFobfZQBlVES6USaxnSrRbTX88vR1s8JuPhe6bFcd6biJh3v46kHcckJoWinkAo2vR
         v5kYlOukWND/6Ezl9hhr3wBR1d+sS8SqqgHvMhG6coFAibsdC2cTqtY1pEzFjWGms1RA
         K2XNDr76z1+1bF7RGfh6wmDT77QAEYpWfWPWydqCYxoAX3GULqbsjQMERR2YGaAMHK5D
         GinIREAMSSbo8a9fq/96KNUWJPLqNHtX7d4Vj/2bJq+79aedBjLbQ6IIo9jZ/Y3mULiu
         BZyT75tjBI/pKlXrOphtg/v7cL0TI5COlmehmZknGOWWMKL4JXYT+DJxvwzQHR5kIPWR
         7vJg==
X-Forwarded-Encrypted: i=1; AL+hErFp+Y8P1Edqj6zXzm25IipQXOljJVmW1RaIkOUVG3YIvEbVa4R8cN+PoSGIzkcaoji+1TTAzpTFYF9H3bs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JwADxA9zd6PILXENQ2ZL/bCeJo56+9pHhGsv+1pGrBOPl3T3l
	pY8m0OICOKtaA57sYvHDj95zVPqRvxWTBMd7KSdO1RUCLo90p6GJY1mx
X-Gm-Gg: AZFdTZe58LxvQa8WTruV+EGTbUGKx/MvensW6Fw7FUElj7L62Zx/d6b3X1SUCBaVAwt
	TmCxNNJKIZiXExF7yUab12xM82WlZjKBCp23gQMB5SlW8+nvBhzzR9PaZHo6vebN4QEhhB8n3i8
	mIZ/o8HoUgEceN13Zva1dxY0E08ljBUhZ42pNT3nu6w7OHchdSVKFpFNYiXe7EGVpC4LfV93GRc
	s8W+zfU5hudZKhtjEEObhXciejiAqqGTZSA1bZuuoa3fv29VVk/IvVmPsc40fIWsqeQAUHOfz5O
	jiwc2TRWRXTPz76FIc/n9IqtbqofxS6kql6uMjeTqnRc+7A4KlDbgxzHwBlaSrn+khBWhKew6ji
	lfkzgxSckQ1n9eBh6/1UFMbI5cmzqY9mQmjch/gd+Rjzqo3FNrFL9RLRJx1s7OqOpwhxmA0rErP
	bkcnVPxxDwPQadbhhjcDXhM4o6YMEWkRnIjeBPfMAKRD9IYjIq4Yx70oA+ULVC3T73Keytu8BCX
	880QCichjHHan6b80otE3g3ShMersLGKFrmjixNRyc2WJ+7ZRLRbA07Wh9Flr6dG3ogczEU2pO8
	wz90K52NCtiJv1zbrqgUtr/cN7O5nRZr1Zt9gBV4SmpMTaj1Zp+fAxv7R+G2YDeW0AXvcQ==
X-Received: by 2002:a5d:5f88:0:b0:4a3:45b4:f0cc with SMTP id ffacd0b85a97d-4abb253e271mr13430436f8f.3.1795285380632;
        Sat, 21 Nov 2026 10:23:00 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:23:00 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v5 0/3] selftests: net: veth: propagate check failures to exit status
Date: Sat, 21 Nov 2026 19:22:14 +0100
Message-ID: <20261121182217.4609-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Four checks in tools/testing/selftests/net/veth.sh report failures
without setting ret, allowing the script to exit 0 even when a check
fails. Set ret=1 in chk_channels() and the three "bad setting"
negative tests identified by Tianyi during review of v2.

Patch 1 fixes the invalid TX channel test, which used nproc + 1
to determine an out-of-range value. However, nproc can be lower
than num_possible_cpus() when CPU affinity or cpusets restrict
a process, meaning the kernel may accept the requested queue count.
This could cause false failures on a correctly functioning
kernel once earlier patches propagated test failures.

Use the kernel-reported max_tx + 1 instead, ensuring the
attempted value always exceeds the device's supported maximum.
Spotted by Sashiko AI review of v2.

---
v5:
  - Retarget to net-next and drop the Fixes tags
  - Move the invalid-tx fix first, so no commit in the series can
    report a false failure on a correct kernel.
  - Fix the subject prefix on the invalid-tx patch, lost in v4's
    send.
v4: https://lore.kernel.org/all/20261119003003.40482-1-emmaonana18@gmail.com/
  - Patch 2: use if/else instead of "&& { ...; } ||" chains, keep
    lines within 80 columns (thanks Tianyi for the review).
  - Add patch 3 deriving the invalid tx value from the kernel maximum.
v3: https://lore.kernel.org/all/20261116084107.6675-1-emmaonana18@gmail.com/
  - Add Tianyi Gao's Tested-by to patch 1.
  - Add patch 2 fixing the remaining three checks.
v2: https://lore.kernel.org/all/20261115214702.50817-1-emmaonana18@gmail.com/
  - Correct Fixes tag to 1ec2230fc721.
v1: https://lore.kernel.org/all/20261115212117.48496-1-emmaonana18@gmail.com/
  - Initial posting.

Omokefe Emmanuel Onanaroghene (3):
  selftests: net: veth: derive invalid-tx test value from kernel max
  selftests: net: veth: propagate channel-check failures to exit status
  selftests: net: veth: propagate bad-settings check failures to exit
    status

 tools/testing/selftests/net/veth.sh | 31 +++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

-- 
2.43.0

