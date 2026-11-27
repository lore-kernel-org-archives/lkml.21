Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777004;
	b=oywvf4h3fwYlthXPYwN0BsdnsgwnPFrHo5HrYtbAdw3aH8B4QM5mC2ZM2mjJ8HOS6lnF
	 ujycaz5j4sWT92U03m3acoMm8srHEAZMRvbmWPWt5yo3vjzskPOrAlm5J4X38Mzczqs4E
	 ER2YE+0/w0BhT6XO+lenidr/JbVfK6rVb8IbmLxeArRqA9Gh/Jkjp0epKXE2JSH7ZbuuK
	 tPm8Vs2OC6dfBfznb/cwoQaFFFNnexpvLYbUOmZAIxkJEr/CzwG7/iRqad+hcEzfGOrj/
	 ajxJVWnIgV1d13576MzEsPS7SSGjU37iTRgKa3rBgmFFJynJtgNbJJ/c0x4mARCrubg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=FjJXi5krpE2+5wdhVjWmRpm5ckA1fcncKpg6z0V2nbU=;
	b=vMc2vRuKJr/hR5MpsO0NG8WMO/dt7Qp11xcaz5jy3QJ4Hg3rVMN/WLWY9YnGnLue9Rfq
	 Lw9Zn/HD4GLBW5R6znlRnJxynUiewpY8GFtXsXNLV33UjchRGhizo5el+4F0/HZWJDD6i
	 9XJFolYzGhC5usnntCrA4pRbJzK5LZWoVxunyYmgff/NyWJxEhKz/GCoyWknemG1w/Vj5
	 /NB+81W7r1A0gHvtxkF58iUhW9aX1ViOBCKw6UuozbebXFB2qw2DHf0EC1vLhl+6XaF94
	 Jo6eRUlzjT68xJeP5ENed08Hle9ModiW4Cc1QWAho1p4HyDElbeI+sFKU9xOZfsDpuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iiitd.ac.in;
	spf=pass smtp.mailfrom=iiitd.ac.in;
	dkim=pass header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=bi5jb153;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AA5606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:56:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92AA5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iiitd.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iiitd.ac.in header.i=@iiitd.ac.in header.a=rsa-sha256 header.s=google header.b=bi5jb153
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so4526622eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 02:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iiitd.ac.in; s=google; t=1795777003; x=1796381803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FjJXi5krpE2+5wdhVjWmRpm5ckA1fcncKpg6z0V2nbU=;
        b=bi5jb153wW8OES5qJHDlVzAH8Hsyg4mONwXc+GXqwgN0kAnNedyzGQw8vEh83AcgUn
         PHby7b2QJ15t3wwWT0jUGj/PebWSqxl86qShiWlTqorOdOj0BWTWAvU16NplqNMt5Yj4
         HYJ3mLosErapCWFdqcCM8kzH6pWZu5XOFbZW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795777003; x=1796381803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FjJXi5krpE2+5wdhVjWmRpm5ckA1fcncKpg6z0V2nbU=;
        b=zTok7zXJ1TV5B7qObI+c3YR02JmI11N6qr0t7uX85fGYcPUBTjRCs3GnFr5WUQBIQC
         3pkjjv3gJzPgNMwFPdFdPuhh0nadZ+jJ4+AhBV2B/eSmuT2y9ew0tDM1+pxCXe+OBQzY
         OvznkGg3+WmwQhCNkcaJTeqjxCONYnK8lGDCRzQ8SWTV3TjAG2S6dHaXyyCOaSuDOKbr
         RWb2XhGjR8moV/BDagyM1htbPldrhgVZNX5MXWjlmBRVBql6r/Thssu1OHTdFQ8fIugm
         naqTFdV1zxb3QGeGCIOCW8cFNLkSMFZdX+UwixyIQAfKau7A5SY2/V85bqsJwwpNl3Rt
         /gmA==
X-Gm-Message-State: APuU4Z99usZGRnBYv9Mru+P7WAxw4YwPVQBGBy4S3tPNFzI/s4m44ysJ
	lvs6XKyx+qUuhpcNFSlTF50itL2rVMWt02KlBA95jxoUkzBLzK3JF4LlhUxYypv+dM8=
X-Gm-Gg: AZFdTZfeAMjp5UVaC0gUP5ZeISA/mKqsnmQGDKHwVPNkVN1B7XAwYQzH8cG3paaDqEQ
	gqvvKakmI/ARhhogsBft/05FYSanH7rKllY8Z5db3yCOiu6rlcb6Wezz4u9sEbWhrMjVrfS9q/9
	h3d5Tp7AJzWFxQ86TKC66oQFyma75TQ8SItEIGSTwRH5pRN5V0diVIynCCIaOXC58AeHzkMpOXT
	rcoyoqPQ1UZCFeipRAQznDIY2vJn1gIHDcTfgksGk1ThGfHqMn+lVGmd4sbVIyQzU3Gzb6LoKWy
	z1TJvkiljuXy4B9Z82gcRos5HfnKP4I5lcCIH4VkWSV4Bq8zHfzA4wI2z3+8EVbjBFq9kWe9Dyw
	CCEQw2qHaVEQkT9wxN7ZcQesIjgKX4p7zISAH+KUR+fK6Xhr75UGxqNCpZzMgAOIkE9BU/9s8nM
	OptPJFcUPad1e5ArnxR+Hj1mt02D6ezRv0dNC0Xh0FmAv6haXligVu+qeNKqfWDfiyv3tnCXDaj
	EQMSoXPIIGs5CRDE3P33b3Z3QqTui69KAmHbTCsO4dvUsLKG2Jd9JAjPJM73o0A5ecHaqnOqRKh
	o7cnty6LAK4c7+Fp7dgsNWe9acdhaD0pJuE7fpSJueU/JPRYFoPd/KHV5fTf58cJ3ToKV/P445l
	HCh0OPN9khrw5cIOB/eCovDDI1FdbM7VlfMbT/P5Iyai5XhleHqVPEZGKc/tbxGdW
X-Received: by 2002:a05:693c:8951:10b0:386:b4a1:d92a with SMTP id 5a478bee46e88-386b4a1daa3mr14385650eec.1.1795777002629;
        Fri, 27 Nov 2026 02:56:42 -0800 (PST)
Received: from iiitd-S2600STB.iiitd.edu.in ([103.25.231.160])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm40985170eec.0.2026.11.27.02.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 02:56:42 -0800 (PST)
From: Piyus Kedia <piyus@iiitd.ac.in>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>,
	linux-nfs@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kapil Vaswani <kapil@presceralabs.ai>
Subject: [BUG] nfs: NULL dereference in the nfs_xdr_event tracepoint from readdir
Date: Fri, 27 Nov 2026 16:26:37 +0530
Message-Id: <20261127105637.3281004-1-piyus@iiitd.ac.in>
X-Mailer: git-send-email 2.34.1
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

Hi,

The nfs_xdr_event trace class dereferences xdr->rqst, and the readdir
decode path reaches it with that pointer NULL, so enabling the tracepoint
and reading a directory from a server that returns a bad filehandle
oopses.

The class builds its entry from the RPC task:

  fs/nfs/nfstrace.h
      __string(program, xdr->rqst->rq_task->tk_client->cl_program->name)

The readdir decoder has no RPC request.  nfs_readdir_folio_filler() sets
up its stream over the page cache:

  fs/nfs/dir.c:840
      xdr_init_decode_pages(&stream, &buf, xdr_pages, buflen);

and xdr_init_decode_pages() ends with xdr_init_decode(xdr, buf, NULL,
NULL), so xdr->rqst stays NULL for the whole decode.

decode_nfs_fh3() traces on its error path:

  fs/nfs/nfs3xdr.c:442
      trace_nfs_xdr_bad_filehandle(xdr, NFSERR_BADHANDLE);

reached from nfs3_decode_dirent() at fs/nfs/nfs3xdr.c:2017 when a server
sends a filehandle longer than NFS3_FHSIZE or of length zero.  The trace
handler then reads through the NULL request:

  BUG: KASAN: null-ptr-deref in trace_event_get_offsets_nfs_xdr_event+0x32/0x1c0
  Read of size 8 at addr 0000000000000098 by task syz-executor/10770
   trace_nfs_xdr_bad_filehandle+0x16c/0x1b0 fs/nfs/nfstrace.h:1979
   decode_nfs_fh3+0xb5/0xd0 fs/nfs/nfs3xdr.c:442
   nfs3_decode_dirent+0x3be/0x4a0 fs/nfs/nfs3xdr.c:2017
   nfs_readdir_entry_decode+0x14a/0xab0 fs/nfs/dir.c:814
   nfs_readdir_xdr_to_array+0x8af/0x1040 fs/nfs/dir.c:966
   nfs_readdir+0x1003/0x23f0 fs/nfs/dir.c:1277
   iterate_dir+0x29d/0x520 fs/readdir.c:114

0x98 is offsetof(struct rpc_rqst, rq_task).

Two things bound how bad this is: the tracepoint has to be enabled, and
the filehandle has to come from the server, so it is a bad or hostile
server rather than an unprivileged local user.

It is not a logged splat: the read faults in a tracepoint handler, so the
machine takes a fatal exception and dies.

  CR2: 0000000000000098
  Kernel panic - not syncing: Fatal exception

Seen on 7.3.1 and REPRODUCED ON 7.4.0-rc1 (63fe746a609a) with KASAN, same
.config and image before and after, only fs/nfs rebuilt between the two:

  without the patch (#13)   KASAN null-ptr-deref, then the panic above
  with the patch (#14)      the same program opens and reads the directory,
                            no report, twice

The code has been this way since eb3d58c68e39, so v5.13 and later.

A patch follows.  It gives the class a TP_CONDITION so the event only
fires for a stream that has a request, which covers both nfs_xdr_status
and nfs_xdr_bad_filehandle in one place.  The event reports the task and
client ids, so without a request it has nothing to report anyway.

The reproducer runs both ends inside one machine - rpcbind, MOUNT and NFS
servers on 111/2049/2050, the NFS tracepoints enabled through tracefs, and
then a readdir - so it needs no network and no real server.  It is
fuzzer-generated and we are happy to send it on request.

Thanks,
Piyus
