Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795116745;
	b=ERmx/aD5yGgpYr+GrJ6Cz+7Gu+o+8+a/nhDSGsovmW264ylWuYrtEXU5ZtqWso5i22/8
	 XnIXkwvR619TYMHZwMLZVjejbG8HPi8tMZ9iySGYqv3Ju4UAtCT4NHHK1RCwaTCZfyPzs
	 mdaIc3lpy8k6XUHKdGoH8QY69DkdUFNc6ii1hcadMuWBaV7FFZY96P62Qj57UxhKmNWA6
	 XujnlrEsFUZdV5kBdaO2eQcf2ClMAso9gvyh2SqtUTaUpcZPvHghsNJjt3oMtUXJC3Txj
	 gd4tfv63+BuHqwI7RyvfIstmwsSYAdCnBKsZWOD3QFm9IiyfeiK8QdATjcPnrOwGfRg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795116745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Xv9XMeqz3I69IimX7OB4/p06jGyymD0wx2G8UGKTZfQ=;
	b=zat2527T99qw1rIToEeDsceowYBJi5yH/XbMu2P4EHyqpsVFOY8fXNFZbJnNY8XF/EbJ
	 O013Gp+cq1nd4bWBeq0YawTdSd4LvcdwBOpvLoUb2HeZP98nWRh+tZH/KZV0ocx9qm/Te
	 kQzpd66QecMVAqrokkZVSwAV9uPo/9xWTJ6aInOGSPWQ6hzvEGFzSubs4IX43LfZy56Bp
	 z9MlDtiKkVWT4cPGtLSpUz8r0K/GEGzz63cJaQIaG+tSfmm+NV/Ti3Kx37C8a+c4GhZVI
	 yiOwstPPiGuYklwG9yKO8RFmpa7KUVoB/Grj8s68Wf1+RmdFz/M+uUC8gb3fU8npivg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vEOa3Iob;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 060DD606A324
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 19:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 060DD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vEOa3Iob
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b4e04eda5aso948087b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 11:32:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795116744; cv=none;
        d=google.com; s=arc-20260327;
        b=fVNVV8/H5C9Wh/nJ5wDbuVsGjDtqKn4QsqM4ie2wX83P22vZSNtsLPAvjP15s7mAaN
         JU0nTJWa7HsDb5d+faru8AfynQ1Qdayj8h7pEqL/TbKXnB7ajkjNlCskbOpdUFMpDGhE
         2VyJpiwGi3vD+DHuD03uUFIh8gNda/Zq42DXhFRN2loEqj/vy7UPa8vYJ3SekEs7uV34
         IWvxWbZaMToBZrYD7Vi7ea1+LnQeXddIbExeLJ8Zo32OFL5zWNeryNzw2k+eyq/2mH4d
         uzAc7UIeA1HIl3eTc3m7G1ITxM40lzp/uFq8VppHizZO6lxYfL5D+fRSL2CeWC+PfzMz
         GZNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xv9XMeqz3I69IimX7OB4/p06jGyymD0wx2G8UGKTZfQ=;
        fh=7IktRxgqr5BDmHmdnUX17jk3jz9nSV3FyhbJwKSuYas=;
        b=dP8KPjvzwL7qBYfOfAJPdTkKk6bByct4sFd4ImJYzO8GNWHki+rdwBwpQ4ZJaNRwoS
         pbw6c0x67MfFaON6gdHSnzjwcVGN6nDFXvzDwIYS03ryA1yUMbaUkSPuAe4BNMcdGDbw
         99n9iM+Fco5kvr/BsV4s/MWrEhs6A7CoQv9vUUVhM5ATASn1yd03yAj+OEmtKGNDChcK
         gOGviH9zYU59Xr5A+6rB4WMCRgAtT/1zY/WJJHTz+2TrfYNHq/m6H5A6U4RiHPIgQ6/3
         S1mna7k+84uYiSY6BSsprjBHClmKoG4xj1GEig4x3ctO+I4nb8dSOPVyuHE4zJ8M05pa
         /hTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795116744; x=1795721544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xv9XMeqz3I69IimX7OB4/p06jGyymD0wx2G8UGKTZfQ=;
        b=vEOa3Iob3bsc3VLP1rMoVDXJ3oBy7CFxKGiHnI5ipx3e3QHXuyCWqO/ugZshGdoAKm
         JWcQ+PweOfmYk9XVL3UYtm2venSPngWGTECJaVSi3tatvI+e60iyxuWtggAyh5562L8i
         DcWDlqlF5Qab0dNBgJKxgMDpF4cPc+X5wF82DOdbuBZISJ5j7+ncL+2QyIcvSlU8H1mc
         FOmQ68+K4AC5uP1xZ0JDrYFf8JXKvq3luwUW3ELGagDXLprMba6eAYQ/r2PNHGCc2GhN
         mZ43tOjetlF17x3ToMQ40oa56iL2gbBcygZSY2YWyVQuFPp8vG16CYrqVYpN+WV8wKWs
         AZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795116744; x=1795721544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xv9XMeqz3I69IimX7OB4/p06jGyymD0wx2G8UGKTZfQ=;
        b=Poms44/99iUoi5CHL+352pEULc8tyeFcu0gUGl+zLqtzBHX7ejbtzARPEVKm+f3r8H
         zsOzNU9vxI4qAa0QwfB4Acf6eFP+v6oyXH2gEG6tMumboNAk9vviu88T2Vp716u7AJX8
         i7KT+zPpdn5ip8SP8gerO2utkX5L79cgCvCJsQuyfYvII+SD3Y78gb0qnjIwOiN5LxKs
         sw+/aev6/JCAIYH1RUZPIRQRThhiEF/Wvb0p0Vw/BN76LpDosqOEx0QSnEF/pDVCqzIe
         Tb6HaHdPGqDng77YQDVWhd+AsNx+/rznV6XVmC8fktYaR4s+dB4mUi7b6rjl194Dw1MR
         z+ww==
X-Forwarded-Encrypted: i=1; AL+hErEARaycxRTnn2yvnRy0cgkFjVUcw/dx7biNzoyV4/4cPVTJ7INqpqpfjHVZCXsl7zGU7p/DjiqxjntZ50c=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ksegzFdIxIPmVzrDZL5lKegeqZwBt2Yz+nAJ3Fu6bw5lCCqSe
	2QhJ/Q/q6b1kxUpL7Svg7+PRWPoL8Ky3eQfkBJ+6wGeTjyW/tn4Op2I1oHmVyUowpbWSPyXwbFl
	9jv9m78tD16S/QrW6Ad+86JtfLQMOsEqZZcDQ
X-Gm-Gg: AZFdTZfmB5OiEb2cIu00dOTCYMTtFCzvOabBw+5j1vw9u8jxGHC9Kxt5+Y9/iu1rd7O
	Ek4/413BNCwFDIZ5ykuhthU0lwEEpXsfUb2VkUjd4hkFEUzW6KoKIEKFDtRdEEAQfOU+c6DlN2q
	2c1mZk3eQUkBgFZs+5HviLEGd7uiiGJs38LgllVNFIpa6HLWpo7fqiNlN2RigWOjQziXQITjz8+
	O18HmmEDcB2/ta+Ii2iHPaWWLbADW3YxThpmRjkRJKIf1s5CS5ztSTSTdSXYG1P20hkPj4aHUOb
	2cNbNjidUgTJnUX9CTdYmk8KpLfCRNhixZ5T1jum4cOyrCS2WaOxzNgjxN1D4/v6wIid0JNSHzv
	QQIhIhzg75eWV8vRBpo54d+nU4PXZwTDnUwMDC5yihCvuoia3JASdNW74p0OTKrFmYgRJ+VK8nS
	vrYMJcXR32R5Lc+P3no0ssnrGU/FI=
X-Received: by 2002:a05:690e:4894:20b0:67d:b54b:3cb8 with SMTP id
 956f58d0204a3-67df43f5c57mr215394d50.34.1795116743905; Thu, 19 Nov 2026
 11:32:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119180015.933433-1-thnkslprpt@gmail.com> <av88TW3GQRvXJDwA@gremlin>
In-Reply-To: <av88TW3GQRvXJDwA@gremlin>
From: Avi <thnkslprpt@gmail.com>
Date: Thu, 19 Nov 2026 21:31:46 +0200
X-Gm-Features: AclHuK8VZBHxgsR35Omg5I3sBSMaRh6fN_PGQ8RGPAjS_X46z1BtoGQn3KkJiHQ
Message-ID: <CA+jvY9E3XD5mJZ7V-+6HFxEkY1FHNGom42F-nxMZNGtOy9POqA@mail.gmail.com>
Subject: Re: [PATCH] mm: skip temporary folio allocation for anonymous UFFD
 missing faults
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: david@kernel.org, akpm@linux-foundation.org, rppt@kernel.org, 
	peterx@redhat.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	liam@infradead.org, mhocko@suse.com, surenb@google.com, vbabka@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lorenzo - I don't think you are in charge of all of Linux and can
decide who can and cannot submit contributions.
This is a legitimate improvement in my opinion - if you disagree that's fin=
e.
The 'word salad' you describe is my best attempt at describing an
issue that this patch potentially makes worse, but is nevertheless
preexisting.
Regarding cc'ing the right people - you're right, it's very hard to
always know who to CC and who to not include - it's easy to make
mistakes with that.
Good Luck

On Thu, Nov 19, 2026 at 8:22=E2=80=AFPM Lorenzo Stoakes (ARM) <ljs@kernel.o=
rg> wrote:
>
> +cc missing.
>
> Please just stop. You sent 7 series across 6 different subsystems over 11
> hours. You(r AI) even failed to cc the right people (added).
>
> On Thu, Nov 19, 2026 at 08:00:15PM +0200, Avi Weiss wrote:
> > An anonymous write fault on a VMA registered for missing userfaultfd
> > faults currently allocates, zeroes and memcg-charges a folio before
> > checking the PTE and handing the fault to userspace. The folio is then
> > immediately discarded without ever being mapped.
> >
> > Check the PTE and address-space stability under the PTE lock before
> > allocating a folio when missing faults are registered. Deliver the faul=
t
> > to userfaultfd without allocating and discarding a temporary folio.
> >
> > In a four-boot native B/P/B/P comparison, the mean UFFD fault median
> > fell from 13,997.75 ns to 13,093.55 ns (-904.2 ns, -6.46%). A guest
> > allocation trace saw 256 fewer allocations in the faulting task for
> > 256 registered missing faults.
>
> A .9us delta on a _uffd_ fault (nobody in their right mind puts it on a h=
ot
> path) with no standard deviation? Seriously?
>
> >
> > Note: this changes OOM ordering. In a fixed 18 MiB memcg test, the
> > baseline OOM-killed only the faulting client before delivering a UFFD
> > event. With this change, the event reached an unprotected shared handle=
r,
> > and its UFFDIO_COPY allocation could trigger an additional OOM kill of =
the
> > handler. A separate surviving client consequently lost its handler and
> > failed a page-content check after the UFFD registration was released.
> > The same handler-death mechanism was reproducible on the unmodified
> > (mainline) kernel when memory pressure was imposed after event delivery
> > but before UFFDIO_COPY, although the fixed-limit outcomes differed.
>
> This is both unreadable word salad and alludes to you causing possibly
> breaking changes for a barely-distinguishable-from-noise fault time
> improvement.
>
> >
> > Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
>
> Please stop submitting patches, thanks.
>
> "You are expected to understand and to be able to defend everything you
> submit. If you are unable to do so, then do not submit the resulting
> changes."
>
> https://docs.kernel.org/process/generated-content.html
>
> > ---
> >  mm/memory.c | 22 ++++++++++++++++------
> >  1 file changed, 16 insertions(+), 6 deletions(-)
> >
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 0fb676d..63b39fa 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -5547,6 +5547,22 @@ static vm_fault_t do_anonymous_page(struct vm_fa=
ult *vmf)
> >       ret =3D vmf_anon_prepare(vmf);
> >       if (ret)
> >               return ret;
> > +
> > +     if (unlikely(userfaultfd_missing(vma))) {
> > +             vmf->pte =3D pte_offset_map_lock(vma->vm_mm, vmf->pmd,
> > +                             vmf->address, &vmf->ptl);
> > +             if (!vmf->pte)
> > +                     goto unlock;
> > +             if (vmf_pte_changed(vmf)) {
> > +                     update_mmu_tlb(vma, vmf->address, vmf->pte);
> > +                     goto unlock;
> > +             }
> > +             ret =3D check_stable_address_space(vma->vm_mm);
> > +             if (ret)
> > +                     goto unlock;
> > +             pte_unmap_unlock(vmf->pte, vmf->ptl);
> > +             return handle_userfault(vmf, VM_UFFD_MISSING);
> > +     }
> >       /* Returns NULL on OOM or ERR_PTR(-EAGAIN) if we must retry the f=
ault */
> >       folio =3D alloc_anon_folio(vmf);
> >       if (IS_ERR(folio))
> > @@ -5579,12 +5595,6 @@ static vm_fault_t do_anonymous_page(struct vm_fa=
ult *vmf)
> >       if (ret)
> >               goto release;
> >
> > -     /* Deliver the page fault to userland, check inside PT lock */
> > -     if (userfaultfd_missing(vma)) {
> > -             pte_unmap_unlock(vmf->pte, vmf->ptl);
> > -             folio_put(folio);
> > -             return handle_userfault(vmf, VM_UFFD_MISSING);
> > -     }
> >       map_anon_folio_pte_pf(folio, vmf->pte, vma, addr,
> >                             vmf_orig_pte_uffd_wp(vmf));
> >  unlock:
> > --
> > 2.43.0
> >
>
> --
> Cheers, Lorenzo
