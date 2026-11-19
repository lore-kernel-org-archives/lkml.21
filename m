Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106524;
	b=KLC4+r2DnKuNfvLIVAnk9e3PzMuHl4RijkS4MsUIV+kMlB52wODpwBMeIehqbM6nUTn8
	 P7ZkZZs5xdgKGWSwiG/VIea4SKsD7wQDdrHC/afOXbQzFVVwTsi8xuKKxsulwS9NqXeBS
	 VaNW/G0wdvupA8qgL8B+CYwYdBK7zSZrpMmD0CgLIppLseTSo5xq+tGGHzDxUHnjcTIFv
	 bMqxW8vhY4h0nO2MM15zlbRE1duSGx4xyl7cwJErwkdBlP7b8T8H7IxwplC2n5ThhqpuT
	 WH5RHEUrByI/MttneldUJQbkjw3bcDbKAFJoUQ3uL221qEwP2YUyrgf38fZRSunD63g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=HgDd5L0VIORH2VG2v5Fp/wWX0U3z/GJXEnBUz5v1RkU=;
	b=Lpy+aR/RBVVXlU0hpwHbxurKeBQ+zjjp8K3jjYHjBEqeZbo5hds2y7jWKdZZFjXWys+e
	 bX7IyC+7O93KYjvuhBdTPi9Q01s9sQDZ4jo8H49LCsHbY979H4I/3rREl6AeZbvnDzazn
	 2CkUPyYZcnWdugtUEr31uE81uJvDqhBsuptnt83OPPA4jdQ/aBCEfbiJ1VkVN2aHWh3Fp
	 frWuSSTbsIefiBAHCrc6OGYVb98omgE5PyeZUDaZfLwhmGJj670+m1ROIOsbIL+qRRJ7I
	 oPiJDblL6BMZPzRi2jr56E4LKgAzzuk8fVr/mXZQ830SoinWbmCAIVUXLs58wxH8QLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTLbUhHH;
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80873606A331
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 16:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80873606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZTLbUhHH
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2210111c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 08:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795106523; x=1795711323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HgDd5L0VIORH2VG2v5Fp/wWX0U3z/GJXEnBUz5v1RkU=;
        b=ZTLbUhHHtbEifkw55T/7SASi3uFaklxp2yFg3vzaGeTR8ge312YjkAunBIvmi4rQSO
         udI3e3qpMJBVO2EYnEHMvJaN+g2HjnJpcL6Lku4FYz3/GLmZx1LFkh8FDvLQrAb6olQ1
         GXbTxh82NeNBoLcMaCKyPHvfHxPC0yaCrtyHxfMWmgM+8CFXqV0CzAEgj0kYjSo5m5/M
         P3gX292QVX+GAP5nmc+W7CZP11Vm4nAelZC49qbxYqk3aT/DUDSVt9z3Bi8kMTxMuKNX
         nEWhaHYNkpvtGsHGYYaXjez5N5sAD8jj/w6877E5BOpcW3GbRm0xwC9eGRMmBdAE7Qw7
         iktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106523; x=1795711323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HgDd5L0VIORH2VG2v5Fp/wWX0U3z/GJXEnBUz5v1RkU=;
        b=VM14Pfn8F2IwPNHrrIutbK59EZpzvqI/JwIWiH/KUvvwdZaqPp0WjQ7e2rr09ybyTD
         RSjEMUTjSyP8x+HgY2U0UOLxqdSR5x4NRjoLKZEbLuUP/cSh7WbrpZH3ZIJ62+QYuwGS
         wUswQ2ruSpufXu9T9m9gQngbHUErNAWt0OOyZfjvd2Cc5ke682/efN8eg3DnSOiR+P48
         CEyXVJI5wy5p5+oDskn1ZlSShifRM67xEv5ZcWaIk988GXipbBmT5EloqOVc65zycT66
         rJdHZu45gq6ocjyy9V/KpvQ/NEgdOqqAaJ8uQUDKY3ZNbuCkGfBZLqtH33GEuJ/O93CJ
         D6YQ==
X-Forwarded-Encrypted: i=1; AL+hErFmF2kuEj+zIfltACDh9x7O5Shvkg8m7qurJsXSt1/jT4YxOQibZE5If2IBW9ypfzTycKLu3QEizCXF53U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yQWEXoeVPpNx5Z6r9UIC71ZlgWxKbO3l37KqaCFJCUXJBZ5T0
	dOankFtivPBj9prfq3ejW+LInPSI77Ys13olFbm20NCY22AVglatwUmy
X-Gm-Gg: AYBFou1VzAL7MCJOiVw5UxETKUfVtuLkGqrA1Npobgkt++wI+NtWEXeX+dx8rrmTHM7
	8Xt3TDPYLRC9tny2JmuYmGqDUR0DKTJWw9LfLKm74Nzj9sToUWIp3stkWMuI0XDEJmAxeAkeV0f
	Df0ksRbrIZ0/uaL5tJfuzxfEMw9sUoNuD6pphUP2JNG6oS0cnpuKJJHC+6Y2kNMP7dmMIomrl+c
	L4J/m0RVKhkcCoOCjCmjMwK3S2Szbmu1zy/zRJBcQt6t8+n0deu0DUWa3TQTHmdPdbXXpa8MO9l
	p/LwzZh98pg78Ttug+/3PEu7748OZqvjzH/aAfWh1UcLOj2XdvGfh/nOXsWjG4CkwFMLIZ0b8dv
	6tzySer2NPqiL0ia+OqGlihSvrQ1TybiYKVU6cPch+wz86psuVQmb8ZhRvhH7n3GwCTLblTqfuP
	7gxBwUAJAy2aZZrAu+9sEvvW48obMkXinnSnoxMzbk48CdQYJxkY97rQcjjGEyNJ0MzMlz6TQQo
	ks14w9cSxyBqDr/SQNMBaMGpkfklIxlSFR432ywxu4BrdhR2e25+k3Y80HJriOj1QAOWkuD6GM8
	wiC+Z/HHlcVb35xleCoJB6oHuo9NUA29MoqaAM2ACv3cIRH5YxRhmGeNU3z4vokj6uRgdhVAoiR
	haHWRr6V09Q==
X-Received: by 2002:a05:701b:2705:b0:1a0:f970:4f5d with SMTP id a92af1059eb24-1b55688b929mr201816c88.17.1795106522470;
        Thu, 19 Nov 2026 08:42:02 -0800 (PST)
Received: from cps-manycore-1 ([147.46.174.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm327441c88.10.2026.11.19.08.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:42:02 -0800 (PST)
From: Sechang Lim <rhkrqnwk98@gmail.com>
To: bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	jolsa@kernel.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf] bpf: reject override_return programs on uprobe_multi links
Date: Thu, 19 Nov 2026 16:41:40 +0000
Message-ID: <20261119164152.3678373-1-rhkrqnwk98@gmail.com>
X-Mailer: git-send-email 2.56.1
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

bpf_override_return() changes pt_regs->ip to the kernel's
just_return_func for kprobe error injection. Perf uprobes reject
programs using this helper, but uprobe_multi links accept them even
though their pt_regs belong to a user task. When the probe runs, the
task returns to user mode with a kernel address as its instruction
pointer, faults, and exposes that address in its signal frame.

Reject programs marked kprobe_override when creating an uprobe_multi
link. This covers both entry and return probes and matches the perf
uprobe restriction.

Fixes: 89ae89f53d20 ("bpf: Add multi uprobe link")
Signed-off-by: Sechang Lim <rhkrqnwk98@gmail.com>
---
 kernel/trace/bpf_trace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index d22e78e7f28d..45ff81dbca96 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -3297,6 +3297,9 @@ int bpf_uprobe_multi_link_attach(const union bpf_attr *attr, struct bpf_prog *pr
 	if (!is_uprobe_multi(prog))
 		return -EINVAL;
 
+	if (prog->kprobe_override)
+		return -EINVAL;
+
 	flags = attr->link_create.uprobe_multi.flags;
 	if (flags & ~(BPF_F_UPROBE_MULTI_RETURN | BPF_F_UPROBE_MULTI_PATH_FD))
 		return -EINVAL;
-- 
2.56.1

