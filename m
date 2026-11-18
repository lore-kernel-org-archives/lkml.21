Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004524;
	b=buTs8UWt6AuIUBXb9+TZxqrojhO813H5go5+3xPzwffeqxNg1WwucmbrGMO4r5Sp/1ox
	 Fj/uy2RUA5LUMpATZQ+nM3adKS5+NaQgVyoT90EHGBzeMFLXVlvjwtefL6+BOo9w3KMjW
	 i1tK9/z+PhMCf2UMNYQgjmLJO/skFF57JqgM7iYrjMMfPYUp8XCs5bfDGXl/WaiM1fd0r
	 3P6Tf96NoUNYiiYZR7+GIXzFYdK2WXYlv3y/WAKhhAnK0sa9XkXi2zgPa73n21lZr06/6
	 ChWzfUPU0CYhr6NbR1NJZnOX6dzkn51ZpF7AfxmSianeo1eyOdD8W78DSMWACHbp6DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yVl1P/S8CqE+KnNB3DCTb4bcglzeYdTS6qKSH1zjmsk=;
	b=yRf8H44LIxzA3Oy/3RmnxJ5zvT2vG1YujKUxdSLyWBSY19uqaN0FxYSQW3O0XyiqNtiq
	 t/LOzUD3JmRs4PJ/K8K2AeGB7dMckT/uLwJNNWGjphhmhiYhbwpEDsovYqi1qfVro6pLY
	 xaLK1utvnVRp/2/Rn7AE09jwiLRd8jaQnsAi9P9DhX6kn20jjipQhus8BhLxLzpGCxpSX
	 iuDyh7RYBpSKRfoty2Pa3KniUEibXn+ufOjJ6DN4pPIAnBnOd3oW1Es4drHKNoZ9e5oV8
	 e0J6MCA4ywMqZWTsaSsQjwEXL/jFKnQdVJToJ67fA8kuZZ35CST9uFnLmgLpx27gs5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=method-b.uk;
	spf=pass smtp.mailfrom=method-b.uk;
	dkim=pass header.d=method-b.uk header.i=@method-b.uk header.a=rsa-sha256 header.s=google header.b=H+3If0X+;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99B3606A325
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 12:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B99B3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=method-b.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=method-b.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=method-b.uk header.i=@method-b.uk header.a=rsa-sha256 header.s=google header.b=H+3If0X+
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492f0a1b685so599289f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=method-b.uk; s=google; t=1795004522; x=1795609322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yVl1P/S8CqE+KnNB3DCTb4bcglzeYdTS6qKSH1zjmsk=;
        b=H+3If0X+O5GPi1x1cpnVfQTPmh5VijckEpNRjcXQdgvZtIWzdEY+1P4EwZe2cNLLIZ
         LWvDsz1EjIpXK/nGSMSwXkGhlV73mjzSTsiPe6cjhMxDSg6B0GGkhOBXP5HKbXcxQlKE
         /wuJ1xF2qmW3YaXq5CeGaUSoPydoSK9qYWZqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004522; x=1795609322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yVl1P/S8CqE+KnNB3DCTb4bcglzeYdTS6qKSH1zjmsk=;
        b=BHw4BVzt9XeMykZJFw4ap06CxFVvReUOw20GzeyK8yu751gy7j/iUMyckY2M7jnhPZ
         c/a3ZYZh9viywYSrWQczjmoxlZJNZtn6hk6C2ozNL2e+DFoTggGWEIyKsRjQkSFh9Wg3
         sF3jeOAXLwbldAU0cjkdVrnMs6+mOb5BmScPBDVEYnCCtKLaYjuzqqHX6ReUnVco1EJc
         i/M49sdiqCjtDyYlHuvX6hlJTzeR7o8xM2R+mhY+1tCppMo6ABnCUrPqquNqg+98C4ZS
         f//JsepeNu1mGw0qR13qoOeB9fogvoVW20NSEMnsnJCYG125eOqPyFT6liZMQJlpy9mK
         6wdg==
X-Forwarded-Encrypted: i=1; AL+hErH/FexnFV/LcgLoosD0z2jA4keBuqidgmGgt+U6lLlqc8K04rEnLWlNIjn/eGSNdwmcZeiUTpmSCMELSbw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+DwEvotd1YzVBcTUQtsOpzXs4Yz1bzeSqEsh2dki4dvMpJ3/ij
	Q1jtzZn+Puqg7HsktrKdd2mjWMlAI72u9jly1HQ5ceCdVdmSAlQzjZPF1AE2Ef1XkX0=
X-Gm-Gg: AZFdTZcbkOyzAF6/WX74sPuSblLwatY2LNuQxxsTh0jNgF/ISbYmucQiAoTgl3gjRZZ
	QqPGo/KZoNsfCKzwPDXLDWDh8imykEeLCh/zRAz9Y8ta2NFo6aTbI8vrTTMdm409ukbelc/pRI0
	kkUGH1SF/ChcKGakrz4g95NwzhFyhkAITt/kZinaXumDEPdTp9u/H+HDPrchrCptpFMou2svE4Q
	3Xmea2JeVKmptsuCcjsQ+c6e4lNW5F18oXv5V7GUHCI0OUXXBhdjCpNWG1g9+HQXtzWz24lyH5N
	lCAi0STfy+lDnwhFZWC6eJD7W36y2cgTl4JQDl61dR+2beQ+Lp37G5+Ff14MkkgcyQsyeuuD+05
	Tp2KQ3MeMnkqcbylpdDmhQ2FwtgwvfJdl0pGlr5TYZZ5Y62sPhczEBo+08JrziB25hPmfjjvGrL
	gbbTvi+N5HTBIIVsuvHn/UK0scC7LEWogdyMHaLw92EcekbjvkpLzYhHbCsyTQoYUs/pDKJ8Jlg
	djI221/fi0ASKnWgMFfncNAT+pjZ4vFTHWW3F+1ZOMWFUIgl2mMrJEbVjmLAFr10lDot/3dLTh9
	CVASaCJ9Xy2sfkcNXXDBYu2aYaH7lP9Ls12vF1b+8+7s0w8+ieplzSVJ8SEEPo5pANxaHz8gX04
	EEMO2pMETeeWXjesIuuPCFPcgaHMOyA8BNnABr3BW1dA=
X-Received: by 2002:a05:6000:2f85:b0:491:92e5:b5c2 with SMTP id ffacd0b85a97d-4a63947578dmr5837947f8f.15.1795004522038;
        Wed, 18 Nov 2026 04:22:02 -0800 (PST)
Received: from [192.168.1.182] ([193.9.15.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f53dsm4302059f8f.35.2026.11.18.04.22.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 04:22:01 -0800 (PST)
Message-ID: <e2c960ca-7b29-45e1-b650-849fc357f8b0@method-b.uk>
Date: Wed, 18 Nov 2026 12:22:00 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] 9p: fix data corruption with writeback caching during
 concurrent stat
To: David Howells <dhowells@redhat.com>, Pierre Barre <pierre@barre.sh>
Cc: ericvh@kernel.org, lucho@ionkov.net, asmadeus@codewreck.org,
 linux_oss@crudebyte.com, v9fs@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251227083751.715152-1-pierre@barre.sh>
 <1667424.1771432276@warthog.procyon.org.uk>
Content-Language: en-US
From: Michael Mulqueen <mike@method-b.uk>
In-Reply-To: <1667424.1771432276@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I've encountered this bug and have spent some time confirming it and
writing a minimal reproducer script for it.

I've bisected it with my reproducer script and found it was introduced
in v6.4, specifically commit d9bc0d11e33b. I wasn't sure about the
etiquette of jumping straight into a discussion and tagging regzbot, so
I haven't, but I'm pretty confident that this is where the regression
was introduced. That is the commit that adds the writeback path -
before it, cache=mmap did not buffer writes through the page cache, so
a stale getattr had no unsent data to zero.

I cannot reproduce it on cache=readahead, only on the writeback path
that cache=mmap uses.

The reproducer writes with O_APPEND in one thread while another thread
stats the file and then reads the server copy back at the end. It
writes for a fixed period of 5 seconds, which is why the number of
records in the output differs, but it reproduces reliably on every run.
It needs diod installed and has to be run as root. Here's the output on
the current v7.3 release:

cache=mmap: appending for 5s while a reader stat()s the file...
  -> 689268 NUL bytes in the server's copy, 13897 of 16642 records lost
cache=readahead: appending for 5s while a reader stat()s the file...
  -> 0 NUL bytes in the server's copy, 0 of 10179 records lost

I have tried the fixes (Pierre Barre's v1 and v2, 27 December 2025, and
David Howells' sketch, 18 February 2026) discussed in this thread and
they appear to resolve it in the basic case. Pierre's apply cleanly to
v7.3; David's I rebased by hand (its step 5 is already present as
c60ae98c5aa6). My reproducer is too minimal to address all the points
raised in this thread, it only confirms that it's still present in the
latest kernel and that it regressed from v6.3 to v6.4. I'll try to find
some more time in the next couple of weeks to test the patches 
comprehensively, but I wanted toshare what I already have in case it is
useful to anyone else looking into this.

--- repro-b.py --------------------------------------------------------

#!/usr/bin/env python3
import os, re, shutil, socket, subprocess, tempfile, threading, time

base = tempfile.mkdtemp(prefix="p9b.")
exp = base + "/export"
mnt = base + "/mnt"
os.mkdir(exp)
os.mkdir(mnt)

port = 5700 + os.getpid() % 200
srv = subprocess.Popen(
    ["diod", "-f", "-n", "-l", f"127.0.0.1:{port}", "-e", exp],
    stderr=subprocess.PIPE)
for _ in range(100):
    try:
        socket.create_connection(("127.0.0.1", port), 0.2).close()
        break
    except OSError:
        time.sleep(0.05)
else:
    srv.terminate()
    raise SystemExit("diod failed to start:\n"
                     + srv.stderr.read().decode())
print(f"diod up on 127.0.0.1:{port}", flush=True)


def run(mode, seconds=5):
    opts = (f"trans=tcp,port={port},version=9p2000.L,cache={mode},"
            f"aname={exp},uname=root,access=any,ignoreqv")
    subprocess.run(["mount", "-t", "9p", "-o", opts,
                    "127.0.0.1", mnt], check=True)
    log = mnt + "/app.log"
    open(log, "w").close()
    print(f"cache={mode}: appending for {seconds}s while a reader "
          f"stat()s the file...", flush=True)

    stop = threading.Event()

    def poll():
        while not stop.is_set():
            try:
                os.stat(log)
            except OSError:
                pass

    threading.Thread(target=poll, daemon=True).start()

    fd = os.open(log, os.O_WRONLY | os.O_APPEND)
    n = 0
    end = time.time() + seconds
    while time.time() < end:
        os.write(fd, b"%08d " % n + b"x" * 90 + b"\n")
        n += 1
    os.fsync(fd)
    os.close(fd)
    stop.set()

    data = open(exp + "/app.log", "rb").read()
    nul = data.count(0)
    intact = len(set(re.findall(rb"(\d{8}) x{90}", data)))
    subprocess.run(["umount", "-l", mnt], stderr=subprocess.DEVNULL)
    print(f"  -> {nul} NUL bytes in the server's copy, "
          f"{n - intact} of {n} records lost", flush=True)


try:
    run("mmap")
    run("readahead")
finally:
    srv.terminate()
    srv.wait()
    shutil.rmtree(base, ignore_errors=True)

--- end repro-b.py ----------------------------------------------------

Cheers,
Mike
